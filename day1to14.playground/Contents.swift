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

// Checkpoint 3. Day 5 & 6.
for number in 1...100 {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if number.isMultiple(of: 3) {
        print("Fizz")
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
}

// Checkpoint 4. Day 7 & 8
enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func squareRoot(of number: Int) throws -> Int {
    guard number >= 1 && number <= 10_000 else {
        throw SquareRootError.outOfBounds
    }
    
    for result in 1...number {
        if result * result == number {
            return result
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    print(try squareRoot(of: 4))
    print(try squareRoot(of: 144))
    print(try squareRoot(of: 5))
} catch {
    switch error {
    case SquareRootError.outOfBounds:
        print("Out of bounds")
    case SquareRootError.noRoot:
        print("No root")
    default:
        print("Other error occurred")
    }
}
