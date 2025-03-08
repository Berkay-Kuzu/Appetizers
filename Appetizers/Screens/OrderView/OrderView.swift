//
//  OrderView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack{
                    List {
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("button tapped")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 20)
                }
                .navigationTitle("🧾 Order")
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty_state",
                               message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
        }
    }
}

#Preview {
    OrderView()
}
