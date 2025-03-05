//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Berkay on 3.03.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    
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
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                    }
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs)")
                    }
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein)")
                    }
                }
            }
            Spacer()
            Button {
                print("Order Button is tapped")
            } label: {
                Text("\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 280, height: 50)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
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
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.black)
                }
            }

        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
