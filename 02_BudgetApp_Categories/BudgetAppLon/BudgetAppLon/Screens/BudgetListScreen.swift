//
//  BudgetListScreen.swift
//  BudgetAppLon
//
//  Created by MacBookAir2019 on 17/10/24.
//

import SwiftUI
struct BudgetListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("Budgets will be displayed here...")
        }.navigationTitle("Budget App")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Budget") {
                        isPresented = true
                    }
                }
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetScreen()
            })
    }
}

//#Preview {
//    NavigationStack {
//        BudgetListScreen()
//    }
//}
