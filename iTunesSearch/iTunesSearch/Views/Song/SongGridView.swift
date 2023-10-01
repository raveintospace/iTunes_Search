//
//  SongGridView.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import SwiftUI

struct SongGridView: View {
    let songs: [Song]
    let selectedSong: Song?
    
    var body: some View {
        Grid(horizontalSpacing: 20) {
            ForEach(songs) { song in
                GridRow {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                    Text(song.trackName)
                        .gridColumnAlignment(.leading)
                    Spacer()
                    Text(formattedDurationSong(time: song.trackTimeMillis))
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
    }
}

struct SongGridView_Previews: PreviewProvider {
    static var previews: some View {
        SongGridView(songs: [Song.songExample(), Song.songExampleTwo()], selectedSong: nil)
    }
}
