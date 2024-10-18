//
//  AddBudgetScreen.swift
//  BudgetAppLon
//
//  Created by Rene Alonzo Choque Saire on 17/10/24.
//
import SwiftUI

struct AddBudgetScreen: View {
    
    @State private var title: String = ""
    @State private var limit: Double?
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace && limit != nil && Double(limit!) > 0
    }
    
    var body: some View {
        Form {
            Text("New Budget")
                .font(.title)
                .font(.headline)
            
            TextField("Title", text: $title)
                .presentationDetents([.medium])
            TextField("Limit", value: $limit, format: .number)
                .keyboardType(.numberPad)
            Button {
                // action
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isFormValid)
            .presentationDetents([.medium])

        }
    }
}

//#Preview {
//    AddBudgetScreen()
//}
