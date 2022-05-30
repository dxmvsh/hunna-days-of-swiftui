//
//  LengthUnit.swift
//  UnitConverter
//
//  Created by Dimash on 29.05.2022.
//

import Foundation

enum LengthUnit: CaseIterable, Equatable {
    case meter
    case kilometer
    case feet
    case yard
    case mile
    
    var localizedString: String {
        switch self {
        case .meter:
            return "Meters"
        case .kilometer:
            return "Kilometers"
        case .feet:
            return "Feet"
        case .yard:
            return "Yards"
        case .mile:
            return "Miles"
        }
    }
    
    var symbol: String {
        switch self {
        case .meter:
            return "m"
        case .kilometer:
            return "km"
        case .feet:
            return "ft"
        case .yard:
            return "yards"
        case .mile:
            return "miles"
        }
    }
    
}
