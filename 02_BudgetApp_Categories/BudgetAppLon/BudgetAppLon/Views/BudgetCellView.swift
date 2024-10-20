//
//  BudgetCellView.swift
//  BudgetAppLon
//
//  Created by Rene Alonzo Choque Saire on 20/10/24.
//


import Foundationimport SwiftUI struct BudgetCellView: View {        let budget: Budget        var body: some View {        HStack {            Text(budget.title ?? "")            Spacer()            Text(budget.limit, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))        }    }}