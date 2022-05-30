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
    
    func convert(value: Double, to unit: LengthUnit) -> Double {
        guard self != unit else {
            return value
        }
        
        if unit == .meter {
            switch self {
            case .meter:
                return value
            case .kilometer:
                return value * 1000
            case .feet:
                return value * 0.3048
            case .yard:
                return value * 0.9144
            case .mile:
                return value * 1609.344
            }
        }
        switch self {
        case .meter:
            return convert(value: value, to: .meter)
        case .kilometer:
            return convert(value: value, to: .meter) * 1000
        case .feet:
            return convert(value: value, to: .meter) * 0.3048
        case .yard:
            return convert(value: value, to: .meter) * 0.9144
        case .mile:
            return convert(value: value, to: .meter) * 1609.344
        }
    }
}
