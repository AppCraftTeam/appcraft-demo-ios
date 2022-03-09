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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = .init()
        AppCoordinator().start(window: self.window)
        return true
    }

}

