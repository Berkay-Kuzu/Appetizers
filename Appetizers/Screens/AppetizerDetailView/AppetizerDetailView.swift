//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Berkay on 3.03.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    var appetizer: Appetizer
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            VStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
            }
            
            Spacer()
            VStack() {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                Text(appetizer.description)
                    .font(.system(size: 17, weight: .regular))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.all, 5)
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button {
                order.addNewItem(item: appetizer)
                isShowingDetail = false
            } label: {
//                APButton(title: ("\(appetizer.price, specifier: "%.2f") - Add to Order"))
                Text("\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                print("dismiss tapped")
                isShowingDetail = false
            } label: {
                XDismissButton()
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
