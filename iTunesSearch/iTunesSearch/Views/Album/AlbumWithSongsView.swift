//
//  AlbumWithSongsView.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import SwiftUI

struct AlbumWithSongsView: View {
    
    @ObservedObject var albumWithSongsViewModel: AlbumWithSongsViewModel
    let selectedSong: Song?
    
    var body: some View {
        ScrollView {
            
            if albumWithSongsViewModel.state == .isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                Grid(horizontalSpacing: 20) {
                    ForEach(albumWithSongsViewModel.songsInAlbum) { song in
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
                        
                        Divider()
                    }
                }
                .padding([.vertical, .leading])
            }
        }
    }
}

struct AlbumWithSongsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumWithSongsView(albumWithSongsViewModel: AlbumWithSongsViewModel.example(), selectedSong: nil)
    }
}
