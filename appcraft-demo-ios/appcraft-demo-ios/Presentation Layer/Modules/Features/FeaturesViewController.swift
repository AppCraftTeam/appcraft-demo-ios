//
//  FeaturesViewController.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import DPUIKit

class FeaturesViewController: DPViewController {
    
    // MARK: Components
    private lazy var tableView: DPTableView = {
        let table = DPTableView()
        table.registerCellClasses([
            FeatureTableRowCell.self
        ])
        table.dataOutput = self
        return table
    }()
    
    // MARK: - Properties
    // MARK: System
    private var model: FeaturesViewModel? {
        get { self._model as? FeaturesViewModel }
        set { self._model = newValue }
    }
    
    private var router: FeaturesViewRouter? {
        get { self._router as? FeaturesViewRouter }
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
        self.view = self.tableView
    }
    
    override func setupComponents() {
        self.title = "Feature list"
    }
    
    override func updateComponents() {
        super.updateComponents()
        let rows = prepareRows()
        self.tableView.reloadData(with: [ .init(rows: rows) ])
    }
    
    // MARK: - Module methods
    private func prepareRows() -> [DPTableRowModel] {
        guard let model = model else {
            return []
        }
        return model.featuresModels.map({ (feature) -> DPTableRowModel in
            FeatureTableRowCell.Model(feature: feature)
        })
    }
    
    private func showFeatureDetail(feature: FeatureModel) {
        switch feature.type {
        case .testFeaeture:
            break
        }
    }
}

// MARK: - DPTableDataOutput methods
extension FeaturesViewController: DPTableDataOutput {
    func selectRow(_ tableView: DPTableView, indexPath: IndexPath, cell: UITableViewCell, row: DPTableRowModel) {
        guard let row = row as? FeatureTableRowCell.Model else {
            return
        }
        self.showFeatureDetail(feature: row.feature)
    }
}
