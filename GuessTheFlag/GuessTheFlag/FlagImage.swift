//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Dimash on 05.06.2022.
//

import SwiftUI

struct FlagImage: View {
    
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
}
