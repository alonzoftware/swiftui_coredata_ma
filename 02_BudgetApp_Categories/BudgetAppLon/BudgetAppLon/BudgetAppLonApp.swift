//
//  BudgetAppLonApp.swift
//  BudgetAppLon
//
//  Created by Rene Alonzo Choque Saire on 17/10/24.
//

import SwiftUI

@main
struct BudgetAppLonApp: App {
    let provider: CoreDataProvider
    
    init() {
        provider = CoreDataProvider()
    }
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, provider.context)
//        }
        WindowGroup {
            if #available(iOS 17.0, *){
                BudgetListScreen17()
                    .environment(\.managedObjectContext, provider.context)
            }else{
                BudgetListScreen()
                    .environment(\.managedObjectContext, provider.context)
            }
            
        }
    }
}
