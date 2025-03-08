//
//  EmptyState.swift
//  Appetizers
//
//  Created by Berkay on 8.03.2025.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
            VStack(){
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            
        }
    }
}

#Preview {
    EmptyState(imageName: "empty_state", message: "This is our test empty state message.\nIt can be a much longer. Anyway!")
}
