//
//  AddMovieViewModel.swift
//  MovieAppLon
//
//  Created by Rene Alonzo Choque Saire on 11/8/24.
//

import Foundation
class AddMovieViewModel: ObservableObject {
    
    var title: String = ""
    var director: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
    
    func save() {
        
        let manager = CoreDataManager.shared
        let movie = Movie(context: manager.persistentContainer.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        manager.save()
    }
    
}
