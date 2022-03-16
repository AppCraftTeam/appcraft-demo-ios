//
//  AppThemeManager.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 14.03.2022.
//

import Foundation
import ACTheme
import UIKit

public struct AppThemeSettings: ACThemeSettingsProtocol {
    let mainBg: UIColor
}

public extension AppThemeSettings {
    static let light = AppThemeSettings(mainBg: .white)
    static let dark = AppThemeSettings(mainBg: .black)
}

