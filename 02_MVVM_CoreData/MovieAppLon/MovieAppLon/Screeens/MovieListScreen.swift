//
//  MovieListScreen.swift
//  MovieAppLon
//
//  Created by Rene Alonzo Choque Saire on 10/8/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            
            Text("Movies")
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            
        },  content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            
        })
    }
}

struct MovieCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("movie.title")
                    .fontWeight(.bold)
                Text("movie.director")
                    .font(.caption2)
                Text("movie.releaseDate ?? ")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(2))
        }
    }
}
//struct MovieListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MovieListScreen()
//        }
//    }
//}
//
//#Preview {
//    MovieListScreen()
//}
