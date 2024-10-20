//
//  BudgetListScreen.swift
//  BudgetAppLon
//
//  Created by MacBookAir2019 on 17/10/24.
//

import SwiftUI
struct BudgetListScreen: View {
    @FetchRequest(sortDescriptors: []) private var budgets: FetchedResults<Budget>
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Label("Add Budget", systemImage: "plus")
                    //.padding()
                        .foregroundStyle(.white)
                    //.background(.red)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            List(budgets) { budget in
                Text(budget.title ?? "")
            }
            Spacer()
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
