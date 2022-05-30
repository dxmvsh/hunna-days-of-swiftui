//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dimash on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    let units: [LengthUnit] = LengthUnit.allCases
    @State private var inputSelectedUnit = LengthUnit.kilometer
    @State private var outputSelectedUnit = LengthUnit.meter
    
    @State private var inputValue = 0.0
    private var outputValue: Double {
        inputSelectedUnit.convert(
            value: inputValue,
            to: outputSelectedUnit
        )
    }
    
    private var outputText: String {
        String(format: "%g", outputValue)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Input Source Unit", selection: $inputSelectedUnit) {
                        ForEach(units, id: \.self) { element in
                            Text(element.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value")
                }
                Section {
                    Text(outputText)
                    Picker("Output Source Unit", selection: $outputSelectedUnit) {
                        ForEach(units, id: \.self) { element in
                            Text(element.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Value")
                }
            }
            .navigationTitle("UnitConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
