//
//  MovieSectionView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct MovieSectionView: View {
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(movies) { movie in
                    Text(movie.trackName)
                }
            }
        }
    }
}

struct MovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionView(movies: [Movie.movieExample()])
    }
}
