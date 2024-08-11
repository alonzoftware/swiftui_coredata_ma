//
//  CoreDataManager.swift
//  HelloCoreDataAppLon
//
//  Created by MacBookAir on 10/8/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "AppDataBase")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed to initialize \(error.localizedDescription)")
            }
        }
    }
    func updateMovie() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    func deleteMovie(movie: Movie) {
            
            persistentContainer.viewContext.delete(movie)
            
            do {
                try persistentContainer.viewContext.save()
                print("Movie deleted!")
            } catch {
                persistentContainer.viewContext.rollback()
                print("Failed to delete context \(error.localizedDescription)")
            }
            
        }
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    func saveMovie(title: String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie \(error)")
        }
       
        
    }
    
}
