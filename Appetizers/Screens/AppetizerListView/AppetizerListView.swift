//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewViewModel()
    @State var selectedAppetizer: Appetizer?
    @State private var isShowingDetail = false
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            self.selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(isShowingDetail)
            }
            .onAppear {
                //  appetizerListViewModel.getAppetizers() can be written if viewModel init is not written
                // here is initialized when the view is appear
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: self.selectedAppetizer ?? MockData.sampleAppetizer,
                                    isShowingDetail: $isShowingDetail)
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
