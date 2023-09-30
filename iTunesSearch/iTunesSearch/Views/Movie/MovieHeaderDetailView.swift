//
//  MovieHeaderDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 30/9/23.
//

import SwiftUI

struct MovieHeaderDetailView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            ObjectImageView(urlString: movie.artworkUrl100, size: 100)
            VStack(alignment: .leading) {
                Text(movie.trackName)
                    .lineLimit(1)
                
                Text(movie.artistName)
                    .font(.footnote)
                    .foregroundColor(Color(.label))
                    .lineLimit(1)
                
                Text("Rating: \(movie.contentAdvisoryRating)")
                    .font(.footnote)
                    .foregroundColor(Color(.label))
                    .offset(y: 48)
            }
            
            Spacer(minLength: 20)
            BuyButton(urlString: movie.trackViewURL, price: movie.trackRentalPrice, currency: movie.currency)
                .offset(y: 70)
        }
        .padding()
        .background(
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 5))
    }
}

struct MovieHeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHeaderDetailView(movie: Movie.movieExample())
    }
}
