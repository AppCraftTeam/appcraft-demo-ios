//
//  AppCoordinator.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 09.03.2022.
//

import Foundation
import UIKit
import DPUIKit

class AppCoordinator {
    
    func start(window: UIWindow?) {
        window?.rootViewController = DPNavigationController(rootViewController: InitialViewController())
        window?.makeKeyAndVisible()
    }
    
}
