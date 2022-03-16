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
    override func setupComponents() {
        super.setupComponents()
        
        self.view.applyTheme { view, theme in
            view.backgroundColor = theme.mainBg
        }
        
        let mainLabel = UILabel().applyStyles(.numberOfLines(0), .textAlignment(.center))
        mainLabel.applyLocalized { view in
            view.text = Strings.initialMain
        }
        
        let subtitleLabel = UILabel().applyStyles(.numberOfLines(0), .textAlignment(.center))
        subtitleLabel.applyLocalized { view in
            view.text = Strings.initialSubtitle
        }
        
        let langLabel = UILabel().applyStyles(.numberOfLines(0), .textAlignment(.center))
        langLabel.applyLocalized { view in
            view.text = Strings.initialCurrentLang(AppLocalizedManager.shared.language?.rawValue ?? "emty")
        }
        
        let button = DPButton(type: .system) {
            AppLocalizedManager.shared.language = AppLocalizedManager.shared.language == .ru ? .en : .ru
        }
        
        button.applyLocalized { button in
            button.applyStyles(.setTitle(Strings.initialChangeBt))
        }
        
        let stackView = UIStackView(arrangedSubviews: [mainLabel, subtitleLabel, langLabel, .init(), button]).applyStyles(
            .axis(.vertical), .directionalLayoutMargins(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        )
        stackView.addToSuperview(self.view, withConstraints: [
            .centerYEqualToSuperview(),
            .leadingEqualToSuperview(),
            .trailingEqualToSuperview(),
            .heightEqualToConstant(200)
        ])
        
    }
    
}
