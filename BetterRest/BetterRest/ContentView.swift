//
//  ContentView.swift
//  BetterRest
//
//  Created by Dimash on 06.06.2022.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var selectedCoffeeAmountIndex = 0
    private var coffeeAmount: Int {
        return selectedCoffeeAmountIndex + 1
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                }
                Section("Desired amount of sleep") {
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                }
                Section() {
                    Picker("Daily coffee intake", selection: $selectedCoffeeAmountIndex) {
                        ForEach(1..<21) { number in
                            Text("\(number) \(number == 1 ? "cup" : "cups")")
                        }
                    }
                }
                Section("Your ideal bedtime is...") {
                    Text(calculateBedTime())
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .navigationTitle("BetterRest")
        }
        
    }
    
    func calculateBedTime() -> String {
        do {
            let configuration = MLModelConfiguration()
            let model = try SleepCalculator(configuration: configuration)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            let sleepTime = wakeUp - prediction.actualSleep
            return "\(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            return "Sorry, there was a problem calculating your bedtime"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
