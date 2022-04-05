//
//  DPViewRouter+Initial.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//

import DPUIKit

extension DPViewRouter {
    func showInitial() {
        let vc = InitialViewController()
        let navigation = DPNavigationController(rootViewController: vc)
        self.setupRootController(navigation)
    }
}
