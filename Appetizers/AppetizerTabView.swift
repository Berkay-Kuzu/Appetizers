//
//  ContentView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("House")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }.tint(.primary)
    }
}

#Preview {
    AppetizerTabView()
}
