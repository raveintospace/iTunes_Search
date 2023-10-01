//
//  MovieInfoDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 1/10/23.
//

import SwiftUI

struct MovieInfoDetailView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Information")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 2)
                HStack() {
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("Genre")
                        Text("Released")
                        Text("Run Time")
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        Text(movie.primaryGenreName)
                        Text(formattedDate(value: movie.releaseDate))
                        if let duration = movie.trackTimeMillis {
                            Text(formattedDurationMovie(time: duration))
                        } else {
                            Text("No duration available")
                        }
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct MovieInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoDetailView(movie: Movie.movieExample())
    }
}
