//
//  CoreDataProvider.swift
//  TodoLon
//
//  Created by Rene Alonzo Choque Saire on 15/10/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "TodoModel")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Core Data store failed to initialize \(error)")
            }
        }
    }
    static var preview: CoreDataProvider = {
        
        let provider = CoreDataProvider(inMemory: true)
        let viewContext = provider.viewContext
        
        for index in 1..<10 {
            let todoItem = TodoItem(context: viewContext)
            todoItem.title = "TodoItem \(index)"
            todoItem.isCompleted = index % 2 == 0 ? true: false
        }
        
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        
        return provider
    }()
    
    
    
}
