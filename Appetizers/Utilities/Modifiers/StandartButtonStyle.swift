//
//  StandartButtonStyle.swift
//  Appetizers
//
//  Created by Berkay on 8.03.2025.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.primary)
            .controlSize(.large)
    }
}
