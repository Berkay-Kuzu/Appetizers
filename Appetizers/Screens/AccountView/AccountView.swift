//
//  AccountView.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import SwiftUI

enum FormTextFieldType {
    case firstName, lastName, email
}

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextFieldType?
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {focusedTextField = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {focusedTextField = .email}
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {focusedTextField = nil}
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in: Date().oneHundredYearsAgo ... Date().eighteenYearsAgo,
                               displayedComponents: .date)
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
            }
            .tint(.primary)
            .navigationTitle("😀 Account")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") {focusedTextField = nil}
                }
            }
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
