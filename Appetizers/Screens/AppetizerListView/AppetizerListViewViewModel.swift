//
//  AppetizerListViewViewModel.swift
//  Appetizers
//
//  Created by Berkay on 2.03.2025.
//

import SwiftUI

final class AppetizerListViewViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetail = false
    
    init() {
        getAppetizers()
    }
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                DispatchQueue.main.async {
                    switch result {
                    case .success(let appetizers):
                        self.appetizers = appetizers
                    case .failure(let error):
                        print("appetizers error:\(error)")
                        self.showError(error: error)
                    }
                }
            }
        }
    }
    
    func showError(error: APError){
        switch error {
        case .invalidURL:
            alertItem = AlertContext.invalidURL
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .invalidData:
            alertItem = AlertContext.invalidData
        case .unableToComplete:
            alertItem = AlertContext.unableToComplete
        case .decodingFailed:
            alertItem = AlertContext.unableToComplete
        }
    }
}
