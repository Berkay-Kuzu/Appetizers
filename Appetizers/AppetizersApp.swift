//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
