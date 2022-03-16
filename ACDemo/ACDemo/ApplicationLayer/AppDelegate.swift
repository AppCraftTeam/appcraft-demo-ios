//
//  AppDelegate.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 05.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppThemeManager.shared.configure()
        AppLocalizedManager.shared.configure()
        
        self.window = .init()
        self.appCoordinator.start(window: self.window)
        return true
    }

}

