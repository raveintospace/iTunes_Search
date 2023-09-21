//
//  SongRowView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SongRowView: View {
    let song: Song
    
    var body: some View {
        HStack {
            SongImageView(urlString: song.artworkUrl60)
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            if let url = URL(string: song.trackViewURL), let price = song.trackPrice {
                Link(destination: url) {
                    Text("\(Int(price)) \(song.currency)")
                }
            }
        }
    }
}
    
    struct SongRowView_Previews: PreviewProvider {
        static var previews: some View {
            SongRowView(song: Song.songExample())
        }
    }
