//
//  AccountView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button {
                        print("Save")
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section("Request") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.isExtraNapkinsEnabled)
                    Toggle("Frequent Refills", isOn: $viewModel.user.isFrequentRefillsEnabled)
                }
            }.tint(.primary)
                .navigationTitle("😀 Account")
        }
        .onAppear() {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
