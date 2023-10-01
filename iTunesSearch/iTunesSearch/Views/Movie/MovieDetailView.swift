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
            VStack(alignment: .leading) {
                Text("Information")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 2)
                HStack() {
                    VStack {
                        Text("Genre")
                    }
                    VStack {
                        Text(movie.primaryGenreName)
                    }
                }
            }
        }
    }
}

/*
 Grid(horizontalSpacing: 20) {
     ForEach(songs) { song in
         GridRow {
             Text("\(song.trackNumber)")
                 .font(.footnote)
                 .gridColumnAlignment(.trailing)
             Text(song.trackName)
                 .gridColumnAlignment(.leading)
             Spacer()
             Text(formattedDuration(time: song.trackTimeMillis))
                 .font(.footnote)
             
             BuySongButton(urlString: song.previewURL,
                           price: song.trackPrice,
                           currency: song.currency)
         }
         .foregroundColor(song == selectedSong ? Color.accentColor : Color(.label))
         .id(song.trackNumber)
         Divider()
     }
 }
 .padding([.vertical, .leading])
 */

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.movieExample())
    }
}
