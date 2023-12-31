//
//  MovieDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 30/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            MovieHeaderDetailView(movie: movie)
            Divider()
            MovieAboutDetailView(movie: movie)
            Divider()
            MovieInfoDetailView(movie: movie)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.movieExample())
    }
}
