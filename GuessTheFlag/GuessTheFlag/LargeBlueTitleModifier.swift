//
//  LargeBlueTitleModifier.swift
//  GuessTheFlag
//
//  Created by Dimash on 05.06.2022.
//

import SwiftUI

struct LargeBlueTitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
}

extension View {
    
    func largeBlue() -> some View {
        modifier(LargeBlueTitleModifier())
    }
    
}
