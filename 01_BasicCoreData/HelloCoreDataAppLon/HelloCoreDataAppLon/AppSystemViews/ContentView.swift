//
//  ContentView.swift
//  HelloCoreDataAppLon
//
//  Created by Rene Alonzo Choque Saire on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needsRefresh: Bool = false
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter movie name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    coreDM.saveMovie(title: movieName)
                    populateMovies()
                }
                //            Only List a Movie
                //            -------------------
                //            List(movies, id: \.self) { movie in
                //                Text(movie.title ?? "")
                //            }
                
                //            List a Movie with Delete Option
                //            -------------------
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink(
                            destination: MovieDetailView(movie: movie, coreDM: coreDM, needsRefresh: $needsRefresh),
                            label: {
                                Text(movie.title ?? "")
                            }
                        )
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }.listStyle(PlainListStyle())
                    .accentColor(needsRefresh ? .white:.black)
                
                Spacer()
            }.padding()
                .onAppear(perform: {
                    populateMovies()
                })
        }
    }
}

//#Preview {
//    ContentView()
//}
