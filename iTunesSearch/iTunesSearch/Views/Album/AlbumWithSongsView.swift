//
//  AlbumWithSongsView.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import SwiftUI

struct AlbumWithSongsView: View {
    
    @ObservedObject var albumWithSongsViewModel: AlbumWithSongsViewModel
    
    var body: some View {
        ScrollView {
            
            if albumWithSongsViewModel.state == .isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(albumWithSongsViewModel.songsInAlbum) { song in
                        HStack {
                            Text("\(song.trackNumber)")
                                .font(.footnote)
                                .frame(width: 25, alignment: .trailing)
                            Text(song.trackName)
                            Spacer()
                            Text(formattedDuration(time: song.trackTimeMillis))
                                .font(.footnote)
                                .frame(width: 50, alignment: .center)
                            BuySongButton(urlString: song.previewURL,
                                          price: song.trackPrice,
                                          currency: song.currency)
                        }
                        Divider()
                    }
                }
                .padding([.vertical, .trailing])
            }
        }
    }
}

struct AlbumWithSongsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumWithSongsView(albumWithSongsViewModel: AlbumWithSongsViewModel.example())
    }
}
