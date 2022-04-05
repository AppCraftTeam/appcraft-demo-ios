//
//  InitialViewController.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import DPUIKit

class InitialViewController: DPViewController {
    
    // MARK: - Properties
    // MARK: System
    private var model: InitialViewModel? {
        get { self._model as? InitialViewModel }
        set { self._model = newValue }
    }
    
    private var router: InitialViewRouter? {
        get { self._router as? InitialViewRouter }
        set { self._router = newValue }
    }
    
    // MARK: - Initialization
    override init() {
        super.init()
        
        self.model = .init()
        self.router = .init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func loadView() {
        let view = UIView()
        view.backgroundColor = AppTheme.background
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.router?.showFeatures()
    }
}
