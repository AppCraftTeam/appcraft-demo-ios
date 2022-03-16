//
//  AppLocalizationManager.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 15.03.2022.
//

import Foundation
import UIKit

public class AppLocalizedManager: ACLocalizedManager<AppLocalizedLanguage> {
    static let shared = AppLocalizedManager()
    
    func configure() {
        self.registerLanguages([.ru, .en])
        
        if self.language == nil {
            self.language = .ru
        }
    }
}

extension NSObject: ACLocalizedManageableProtocol {
    public typealias Language = AppLocalizedLanguage
    
    
    public var localizedManager: ACLocalizedManager<AppLocalizedLanguage> {
        AppLocalizedManager.shared
    }
    
}

// To package
public typealias ACLocalizedClosure = (ACLocalizedProtocol) -> Void
public typealias ACLocalizedSpecificClosure<Object: ACLocalizedProtocol> = (Object) -> Void

public protocol ACLocalizedLanguageProtocol {
    var rawValue: String { get }

    init?(rawValue: String)
}

public protocol ACLocalizedProtocol: AnyObject {
    var didLocalized: ACLocalizedClosure? { get }
}

public protocol ACLocalizedManageableProtocol: ACLocalizedProtocol {
    associatedtype Language: ACLocalizedLanguageProtocol
    
    var localizedManager: ACLocalizedManager<Language> { get }
}

public extension ACLocalizedManageableProtocol {
    
    var didLocalized: ACLocalizedClosure? {
        get { objc_getAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque()) as? ACLocalizedClosure }
        set { objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func applyLocalized(_ didLocalized: @escaping ACLocalizedSpecificClosure<Self>) {
        self.didLocalized = { object in
            guard let object = object as? Self else { return }
            didLocalized(object)
        }
        
        self.localizedManager.addWrapper(ACLocalizedWrapper(object: self))
    }
    
}

public struct ACLocalizedWrapper {
    
    // MARK: - Init
    public init(object: ACLocalizedProtocol) {
        self.object = object
    }
    
    // MARK: - Props
    public private(set) weak var object: ACLocalizedProtocol?
    
    // MARK: - Methods
    public func applyLocalized() {
        guard let object = self.object else { return }
        object.didLocalized?(object)
    }
}

// MARK: - Array + ACLocalizedWrapper
public extension Array where Element == ACLocalizedWrapper {
    
    @discardableResult
    mutating func clearNilsObjects() -> Self {
        self = self.filter({ $0.object != nil })
        
        return self
    }
    
    func applyLocalized() {
        self.forEach({ $0.applyLocalized() })
    }
    
}

open class ACLocalizedManager<Language: ACLocalizedLanguageProtocol> {
    
    // MARK: - Init
    public init() {
        self.languageDidSet()
    }
    
    // MARK: - Props
    open private(set) var wrappers: [ACLocalizedWrapper] = []
    open private(set) var languagesRegistered: [Language] = []
    private let languageRawValueKey = "languageRawValueKey"
    
    private var languageRawValue: String? {
        get { UserDefaults.standard.string(forKey: self.languageRawValueKey) }
        set { UserDefaults.standard.set(newValue, forKey: self.languageRawValueKey) }
    }

    open var language: Language? {
        get { self.languagesRegistered.first(where: { $0.rawValue == self.languageRawValue }) }
        set {
            guard self.languageRawValue != newValue?.rawValue else { return }
            self.languageRawValue = newValue?.rawValue
            self.languageDidSet()
        }
    }
    
    open var localizedBundle: Bundle {
        if let key = self.language?.rawValue, let path = Bundle.main.path(forResource: key, ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle
        } else {
            #if SWIFT_PACKAGE
            return Bundle.module
            #else
            return Bundle(for: Self.self)
            #endif
        }
    }

    // MARK: - Methods
    private func languageDidSet() {
        self.wrappers.clearNilsObjects().applyLocalized()
    }
    
    open func addWrapper(_ wrapper: ACLocalizedWrapper) {
        self.wrappers.clearNilsObjects()
        self.wrappers += [wrapper]
        wrapper.applyLocalized()
    }
    
    open func registerLanguages(_ languages: [Language]) {
        self.languagesRegistered = languages
    }
    
}


