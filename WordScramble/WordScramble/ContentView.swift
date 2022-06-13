//
//  ContentView.swift
//  WordScramble
//
//  Created by Dimash on 13.06.2022.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List(people, id: \.self) {
            Text($0)
        }
    }
    
    private func checker() {
        let word = "fahter"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        let allGood = misspelledRange.location == NSNotFound
        print(allGood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
