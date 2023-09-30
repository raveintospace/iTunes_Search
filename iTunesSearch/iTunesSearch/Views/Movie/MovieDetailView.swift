//
//  MovieDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 30/9/23.
//

import SwiftUI
import ExpandableText

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            MovieHeaderDetailView(movie: movie)
            Divider()
            VStack(alignment: .leading) {
                Text("About the film")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 2)
                if let longDescription = movie.longDescription {
                    ExpandableText(longDescription)
                } else {
                    Text("No description available")
                }
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.movieExample())
    }
}
