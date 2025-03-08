//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct AppetizerListCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            //            WebImage(url: URL(string: appetizer.imageURL)) { image in
            //                  image.resizable()
            //              } placeholder: {
            //                  Rectangle().foregroundColor(.gray)
            //              }
            //              .transition(.fade(duration: 0.5))
            //              .aspectRatio(contentMode: .fill)
            //              .frame(width: 120, height: 90)
            //              .cornerRadius(10)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
            } placeholder: {
                Image("food_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
            }
            // There is no cache feature in AsyncImage. If you want cache feature, you have to use WebImage or AppetizerRemoteImage !!!!
            
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 90)
//                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
