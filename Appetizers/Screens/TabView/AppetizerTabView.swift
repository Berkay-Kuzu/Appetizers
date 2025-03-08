//
//  ContentView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem{Label("Home", systemImage: "house")}
            //                .tabItem {
            //                    Image(systemName: "house")
            //                    Text("House")
            //                }
            
            AccountView()
                .tabItem{Label("Account", systemImage: "person")}
            //                .tabItem {
            //                    Image(systemName: "person")
            //                    Text("Account")
            //                }
            
            OrderView()
                .tabItem{Label("Order", systemImage: "bag")}
                .badge(order.orderItemsCount)
            //                .tabItem {
            //                    Image(systemName: "bag")
            //                    Text("Order")
            //                }
        }.tint(.primary)
    }
}

#Preview {
    AppetizerTabView()
}
