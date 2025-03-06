//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            self.appetizerListViewModel.selectedAppetizer = appetizer
                            appetizerListViewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(appetizerListViewModel.isShowingDetail)
            }
            .onAppear {
                //  appetizerListViewModel.getAppetizers() can be written if viewModel init is not written
                // here is initialized when the view is appear
            }
            .blur(radius: appetizerListViewModel.isShowingDetail ? 20 : 0)
            
            if appetizerListViewModel.isShowingDetail {
                AppetizerDetailView(appetizer: self.appetizerListViewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                                    isShowingDetail: $appetizerListViewModel.isShowingDetail)
            }
            
            if appetizerListViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.5)
            }
        }
        .alert(item: $appetizerListViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
