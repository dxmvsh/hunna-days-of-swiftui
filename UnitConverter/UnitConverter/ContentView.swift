//
//  ContentView.swift
//  UnitConverter
//
//  Created by Dimash on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    private let units: [LengthUnit] = LengthUnit.allCases
    private let converter = LengthUnitConverter()
    
    @State private var inputValue = 0.0
    @State private var inputSelectedUnit = LengthUnit.kilometer
    @State private var outputSelectedUnit = LengthUnit.meter
    
    @FocusState private var inputIsFocused: Bool
    
    private var outputValue: Double {
        converter.convert(
            value: inputValue,
            from: inputSelectedUnit,
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
                        .focused($inputIsFocused)
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
            .keyboardType(.decimalPad)
            .navigationTitle("UnitConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
