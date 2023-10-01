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
            ObjectImageView(urlString: movie.artworkUrl100, size: 100.0)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.primaryGenreName)
                    .foregroundColor(.gray)
                Text(formattedDate(value: movie.releaseDate))
            }
            .font(.caption)
            
            Spacer(minLength: 20)
            BuyButton(urlString: movie.previewURL ?? "", price: movie.trackPrice, currency: movie.currency)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.movieExample())
    }
}
