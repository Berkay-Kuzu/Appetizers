//
//  Order.swift
//  Appetizers
//
//  Created by Berkay on 8.03.2025.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var orderItemsCount: Int {
        return items.count
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addNewItem(item: Appetizer) {
        items.append(item)
    }
    
    func deleteItems(at indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
}
