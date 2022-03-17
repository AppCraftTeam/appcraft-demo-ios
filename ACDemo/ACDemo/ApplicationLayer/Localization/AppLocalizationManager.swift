//
//  AppLocalizationManager.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 15.03.2022.
//

import Foundation
import ACLocalized

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

