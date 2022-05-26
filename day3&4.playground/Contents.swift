import UIKit

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other", "Foundation"])

// Checkpoint 2
let words = ["Salem", "Bala", "Kalay", "Sagyndym", "Bala"]
let uniqueWords = Set(words)
print("Array of words: \(words)")
print("Number of words: \(words.count)")
print("Number of unique words: \(uniqueWords.count)")
