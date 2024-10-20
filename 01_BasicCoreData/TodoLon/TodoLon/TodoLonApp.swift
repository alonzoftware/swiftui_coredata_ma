//
//  TodoLonApp.swift
//  TodoLon
//
//  Created by MacBookAir2019 on 14/10/24.
//

import SwiftUI

@main
struct TodoLonApp: App {
    
    let provider = CoreDataProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, provider.viewContext)        }
    }
}
