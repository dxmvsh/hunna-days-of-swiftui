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

// Checkpoint 5. Day 9

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers.filter({ !$0.isMultiple(of: 2) })
    .sorted(by: { $0 < $1 })
    .map({ "\($0) is lucky number" })
    .forEach({ print($0) })

// Checkpoint 6. Day 10 & 11

struct Car {
    private let model: String
    private let numberOfSeats: Int
    private var currentGear: Int
    
    init?(model: String, numberOfSeats: Int, currentGear: Int) {
        guard currentGear >= 1 && currentGear <= 10 else { return nil }
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func gearUp(by value: Int) {
        guard currentGear + value <= 10 else { return }
        currentGear += value
    }
    
    mutating func gearDown(by value: Int) {
        guard currentGear - value >= 1 else { return }
        currentGear -= value
    }
    
}

var mercedes = Car(model: "Mercedes", numberOfSeats: 4, currentGear: 5)
mercedes?.gearUp(by: 4)
mercedes?.gearDown(by: 3)
print(mercedes!)

// Checkpoint 7. Day 12

class Animal {
    private let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Barks")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Barks in Corgish")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Barks in Poodle-ish")
    }
}

class Cat: Animal {
    private let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meows")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meows in Persian")
    }
}

class Lion: Cat {
    override func speak() {
        print("Meows in Lion-ish")
    }
}

let lion = Lion(legs: 4, isTame: true)
lion.speak()
let persian = Persian(legs: 4, isTame: false)
persian.speak()
let poodle = Poodle(legs: 4)
poodle.speak()

// Checkpoint 8. Day 13
protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    func summary() -> String
}

extension Building {
    func summary() -> String {
        return "Building from estate agent \(estateAgentName) with \(rooms) \(rooms == 1 ? "room" : "rooms") costs $\(cost)"
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var estateAgentName: String
    
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var estateAgentName: String
    
    func summary() -> String {
        return "Office from estate agent \(estateAgentName) with \(rooms) \(rooms == 1 ? "room" : "rooms") costs $\(cost)"
    }
}

let office = Office(rooms: 2, cost: 20_000, estateAgentName: "Big Group")
let house = House(rooms: 4, cost: 20_000_000, estateAgentName: "Even Bigger Group")

house.summary()
office.summary()

// Checkpoint 9. Day 14

func getRandomNumber(from array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

getRandomNumber(from: nil)
getRandomNumber(from: [1, 4, 7])
