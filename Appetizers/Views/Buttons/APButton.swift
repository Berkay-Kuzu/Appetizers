//
//  APButton.swift
//  Appetizers
//
//  Created by Berkay on 6.03.2025.
//

import SwiftUI

struct APButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .semibold))
            .frame(width: 280, height: 50)
            .background(Color.primary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Button")
}
