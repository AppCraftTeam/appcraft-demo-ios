//
//  AppTheme.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 14.03.2022.
//

import Foundation
import ACTheme

public enum AppTheme: String, ACThemeProtocol {
    public typealias ThemeSettings = AppThemeSettings
    
    case light = "light"
    case dark = "dark"
    
    public var settings: AppThemeSettings {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
