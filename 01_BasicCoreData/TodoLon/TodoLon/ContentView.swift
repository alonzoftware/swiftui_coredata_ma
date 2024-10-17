//
//  ContentView.swift
//  TodoLon
//
//  Created by MacBookAir2019 on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItem>
    
    @State private var title: String = ""
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    private func saveTodoItem() {
        let todoItem = TodoItem(context: context)
        todoItem.title = title
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    private var pendingTodoItems: [TodoItem] {
        todoItems.filter { !$0.isCompleted }
    }
    
    private var completedTodoItems: [TodoItem] {
        todoItems.filter { $0.isCompleted }
    }
    
    private func updateTodoItem(_ todoItem: TodoItem) {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    private func deleteTodoItem(_ todoItem: TodoItem) {
        
        context.delete(todoItem)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if isFormValid {
                        saveTodoItem()
                        title = ""
                    }
                }
            
            List {
                Section("Pending") {
                    
                    if pendingTodoItems.isEmpty {
                        if #available(iOS 17.0, *) {
                            ContentUnavailableView("No items found.", systemImage: "doc")
                        }
                    } else {
                        ForEach(pendingTodoItems) { todoItem in
                            TodoCellView(todoItem: todoItem, onChanged: updateTodoItem)
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let todoItem = pendingTodoItems[index]
                                deleteTodoItem(todoItem)
                            }
                        })
                    }
                    
                }
                
                Section("Completed") {
                    if completedTodoItems.isEmpty {
                        if #available(iOS 17.0, *) {
                            ContentUnavailableView("No items found.", systemImage: "doc")
                        }
                    } else {
                        ForEach(completedTodoItems) { todoItem in
                            TodoCellView(todoItem: todoItem, onChanged: updateTodoItem)
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let todoItem = completedTodoItems[index]
                                deleteTodoItem(todoItem)
                            }
                        })
                    }
                }
                
            }.listStyle(.plain)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Todo")
    }
}

struct TodoCellView: View {
    
    let todoItem: TodoItem
    let onChanged: (TodoItem) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.square": "square")
                .onTapGesture {
                    todoItem.isCompleted = !todoItem.isCompleted
                    onChanged(todoItem)
                }
            if todoItem.isCompleted {
                Text(todoItem.title ?? "")
            } else {
                TextField("", text: Binding(get: {
                    todoItem.title ?? ""
                }, set: { newValue in
                    todoItem.title = newValue
                })).onSubmit {
                    onChanged(todoItem)
                }
            }
        }
    }
    
}


//#Preview {
//    ContentView()
//}
//#Preview {
//    NavigationStack {
//        ContentView()
//            .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
//    }
//}
