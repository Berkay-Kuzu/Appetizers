//
//  OrderView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.appetizers
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(orderItems){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                Button {
                    print("button tapped")
                } label: {
                    APButton(title: "Order")
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("🧾 Order")
        }
    }
    
    func deleteItems(at indexSet: IndexSet){
        orderItems.remove(atOffsets: indexSet)
    }
}

#Preview {
    OrderView()
}
