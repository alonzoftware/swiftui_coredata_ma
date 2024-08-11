//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Mohammad Azam on 2/11/21.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let movie: Movie
    @State private var movieName: String = ""
    let coreDM: CoreDataManager
    @Binding var needsRefresh : Bool
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                    needsRefresh.toggle()
                    presentationMode.wrappedValue.dismiss()
                }
                
                
            }
        }.padding()
    }
}

//struct MovieDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let coreDM = CoreDataManager()
//        let movie = Movie(context: coreDM.persistentContainer.viewContext)
//        
//        MovieDetail(movie: movie, coreDM: coreDM)
//    }
//}


//#Preview {
//    MovieDetailView()
//}
