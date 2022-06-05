//
//  TextViewBackgroundModifier.swift
//  WeSplit
//
//  Created by Dimash on 05.06.2022.
//

import Foundation
import SwiftUI

struct TextViewBackgroundModifier: ViewModifier {
    var selectedTip: Int
    
    func body(content: Content) -> some View {
        content
            .background(selectedTip == 0 ? .red : .clear)
    }
    
}

extension View {
    
    func backgroundColor(selectedTip: Int) -> some View {
        modifier(TextViewBackgroundModifier(selectedTip: selectedTip))
    }
    
}
