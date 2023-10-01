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
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        VStack(alignment: .leading) {
                            ObjectImageView(urlString: movie.artworkUrl100, size: 100)
                            Text(movie.trackName)
                                .multilineTextAlignment(.leading)
                            Text(movie.primaryGenreName)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .lineLimit(2)
                        .frame(width: 80)
                        .font(.caption)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }

    }
}

struct MovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionView(movies: [Movie.movieExample()])
    }
}
