//
//  CoreDataManager.swift
//  MovieAppLon
//
//  Created by Rene Alonzo Choque Saire on 10/8/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
    }
    func getMovieById(id: NSManagedObjectID) -> Movie? {
            
            do {
                return try persistentContainer.viewContext.existingObject(with: id) as? Movie
            } catch {
                print(error)
                return nil
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
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save a movie \(error)")
        }
    }
    func deleteMovie(_ movie: Movie) {
            
            persistentContainer.viewContext.delete(movie)
            
            do {
                try persistentContainer.viewContext.save()
            } catch {
                persistentContainer.viewContext.rollback()
                print("Failed to delete movie \(error)")
            }
            
        }
}

