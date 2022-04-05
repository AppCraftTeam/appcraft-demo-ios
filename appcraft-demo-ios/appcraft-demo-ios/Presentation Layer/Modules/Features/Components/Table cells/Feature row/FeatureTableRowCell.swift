//
//  FeatureTableRowCell.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit
import DPUIKit
import Foundation

class FeatureTableRowCell: DPTableRowCell<FeatureTableRowCell.Model> {
    
    // MARK: Model
    class Model: DPTableRowModel {
        
        override var cellIdentifier: String {
            FeatureTableRowCell.className
        }
        
        override var cellHeight: CGFloat {
            44
        }
        
        let feature: FeatureModel
        
        init(feature: FeatureModel) {
            self.feature = feature
        }
    }
    
    // MARK: Components
    private lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.applyStyles(.textColor(AppTheme.mainColor), .font(UIFont.systemFont(ofSize: 14, weight: .semibold)), .textAlignment(.left))
        return label
    }()

    // MARK: - Lifecycle methods
    override func setupComponents() {
        super.setupComponents()
        self.accessoryType = .disclosureIndicator
        self.applyStyles(.backgroundColor(AppTheme.background))
        self.featureLabel.addToSuperview(self, withConstraints: [.edgesToSuperview(.init(top: 4, leading: 16, bottom: -4, trailing: 16))])
    }
    
    override func updateComponents() {
        super.updateComponents()
        self.featureLabel.text = model?.feature.name
    }
}
