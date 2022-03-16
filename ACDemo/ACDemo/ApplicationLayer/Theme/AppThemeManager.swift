//
//  AppThemeManager.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 14.03.2022.
//

import Foundation
import ACTheme

class AppThemeManager: ACThemeManager<AppTheme> {
    static let shared = AppThemeManager()
    
    func configure() {
        self.registerThemes([.light, .dark])
        
        if self.theme == nil {
            self.theme = .light
        }
    }
}

// MARK: - NSObject + AppThemeManager
extension NSObject: ACThemableManageable {
    public typealias Theme = AppTheme
    
    public var themeManager: ACThemeManager<AppTheme> {
        AppThemeManager.shared
    }
}
