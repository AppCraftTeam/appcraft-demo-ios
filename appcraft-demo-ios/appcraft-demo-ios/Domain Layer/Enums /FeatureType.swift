//
//  FeatureType.swift
//  appcraft-demo-ios
//
//  Created by Damian Bazhenov on 5.4.2022.
//

import Foundation

enum FeatureType: CaseIterable {
    case testFeaeture
}

extension FeatureType: CustomStringConvertible {
    var description: String {
        switch self {
        case .testFeaeture:
            return "Test feature"
        }
    }
}

extension Set where Element == FeatureType {
    static var all: Self { Set(FeatureType.allCases) }
}
