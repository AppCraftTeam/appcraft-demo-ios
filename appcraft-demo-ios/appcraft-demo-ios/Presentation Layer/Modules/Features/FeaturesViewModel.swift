//
//  FeaturesViewModel.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import DPUIKit

class FeaturesViewModel: DPViewModel {
    var featuresTypes: Set<FeatureType>
    var featuresModels: [FeatureModel] { featuresTypes.map({ FeatureModel(type: $0) })  }
    
    override init() {
        self.featuresTypes = .all
    }
}
