//
//  NutritionInfo.swift
//  Appetizers
//
//  Created by Berkay on 8.03.2025.
//

import SwiftUI

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
        }
    }
}
