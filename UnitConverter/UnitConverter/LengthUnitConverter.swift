//
//  LengthUnitConverter.swift
//  UnitConverter
//
//  Created by Dimash on 30.05.2022.
//

import Foundation

class LengthUnitConverter {
    
    func convert(value: Double, from inputUnit: LengthUnit, to outputUnit: LengthUnit) -> Double {
        guard inputUnit != outputUnit else {
            return value
        }
        
        if outputUnit == .meter {
            switch inputUnit {
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
        
        switch outputUnit {
        case .meter:
            return convert(value: value, from: inputUnit, to: .meter)
        case .kilometer:
            return convert(value: value, from: inputUnit, to: .meter) * 1000
        case .feet:
            return convert(value: value, from: inputUnit, to: .meter) * 3.28084
        case .yard:
            return convert(value: value, from: inputUnit, to: .meter) * 1.09361
        case .mile:
            return convert(value: value, from: inputUnit, to: .meter) * 0.000621371
        }
    }
    
}
