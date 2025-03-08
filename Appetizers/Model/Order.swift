//
//  Order.swift
//  Appetizers
//
//  Created by Berkay on 8.03.2025.
//

import SwiftUI

final class Order: ObservableObject {
    
    @AppStorage(AppStorageKeys.order.rawValue) var userOrder: Data?
    @Published var items: [Appetizer] = []
    
    var orderItemsCount: Int {
        items.count
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addNewItem(item: Appetizer) {
        items.append(item)
        saveUserOrder()
    }
    
    func deleteItems(at indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        saveUserOrder()
    }
    
    func saveUserOrder() {
        do {
            let data = try JSONEncoder().encode(items)
            self.userOrder = data
        } catch {
           print("user order cannot be saved")
        }
    }
    
    func retrieveUserOrder() {
        guard let data = userOrder else { return }
        
        do {
            items = try JSONDecoder().decode([Appetizer].self, from: data)
        } catch {
            print("user order cannot be retrieved")
        }
    }
}
