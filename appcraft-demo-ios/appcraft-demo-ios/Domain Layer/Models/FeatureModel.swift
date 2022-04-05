//
//  FeatureModel.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//

import Foundation

struct FeatureModel {
    
    var name: String { type.description }
    let type: FeatureType
    
    init(type: FeatureType) {
        self.type = type
    }
}
