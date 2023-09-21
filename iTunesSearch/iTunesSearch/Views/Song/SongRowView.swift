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
            RowImageView(urlString: song.artworkUrl60, size: 60.0)
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 20)
            
            BuyButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
        }
    }
}
    
    struct SongRowView_Previews: PreviewProvider {
        static var previews: some View {
            SongRowView(song: Song.songExample())
        }
    }
