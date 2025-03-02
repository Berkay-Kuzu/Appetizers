//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Berkay on 2.03.2025.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImage(from urlString: String){
        NetworkManager.shared.downloadImage(from: urlString) { uiimage in
            guard let uiimage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food_placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.loadImage(from: urlString)
            }
    }
}
