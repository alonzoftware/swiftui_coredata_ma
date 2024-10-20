//
//  BudgetListScreen17.swift
//  BudgetAppLon
//
//  Created by Rene Alonzo Choque Saire on 20/10/24.
//
import SwiftUI

struct BudgetListScreen17: View {
    
    @FetchRequest(sortDescriptors: []) private var budgets: FetchedResults<Budget>
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            List(budgets) { budget in
                Text(budget.title ?? "")
            }
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
//    }.environment(\.managedObjectContext, CoreDataProvider.preview.context)
//}

