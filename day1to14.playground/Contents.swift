import UIKit

var greeting = "Hello, playground"

// Checkpoint 1. Day 1 & 2.
let temperatureInCelcius = 33.0
let temperatureInFahrenheit = ((temperatureInCelcius * 9) / 5) + 32
let outputText = """
Temperature in Celcius: \(temperatureInCelcius) °C
Temperature in Fahrenheit: \(temperatureInFahrenheit) °F
"""
print(outputText)

// Checkpoint 2. Day 3 & 4.
let words = ["Salem", "Bala", "Kalay", "Sagyndym", "Bala"]
let uniqueWords = Set(words)
print("Array of words: \(words)")
print("Number of words: \(words.count)")
print("Number of unique words: \(uniqueWords.count)")
