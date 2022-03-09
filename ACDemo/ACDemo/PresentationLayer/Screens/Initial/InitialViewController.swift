//
//  InitialViewController.swift
//  ACDemo
//
//  Created by Дмитрий Поляков on 09.03.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit
import DPUIKit

class InitialViewController: DPViewController {
    
    // MARK: - Init
    override init() {
        super.init()
        
        self.model = .init()
        self.router = .init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Props
    private var model: InitialViewModel? {
        get { self._model as? InitialViewModel }
        set { self._model = newValue }
    }
    
    private var router: InitialViewRouter? {
        get { self._router as? InitialViewRouter }
        set { self._router = newValue }
    }
    
    // MARK: - Methods
    
}
