//
//  InitialViewRouter.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import Foundation
import DPUIKit

class InitialViewRouter: DPViewRouter {
    func showFeatures() {
        let vc = FeaturesViewController()
        let featureNavigation = DPNavigationController(rootViewController: vc)
        featureNavigation.modalPresentationStyle = .fullScreen
        self.present(featureNavigation, animated: true, completion: nil)
    }
}
