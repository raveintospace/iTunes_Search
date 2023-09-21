//
//  MovieRowView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            RowImageView(urlString: movie.artworkUrl100, size: 100.0)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.artistName)
                    .foregroundColor(.gray)
                Text(movie.releaseDate)
                    .foregroundColor(.gray)
            }
            .font(.caption)
            
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.movieExample())
    }
}
