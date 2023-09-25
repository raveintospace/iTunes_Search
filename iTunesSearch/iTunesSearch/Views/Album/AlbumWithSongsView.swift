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
            VStack {
                ForEach(albumWithSongsViewModel.songsInAlbum) { song in
                    HStack {
                        Text("\(song.trackNumber)")
                        Text(song.trackName)
                        Text(formattedDuration(time: song.trackTimeMillis))
                        
                        Spacer()
                        BuySongButton(urlString: song.previewURL,
                                      price: song.trackPrice,
                                      currency: song.currency)
                    }
                }
            }
            .padding()
        }
    }
}

struct AlbumWithSongsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumWithSongsView(albumWithSongsViewModel: AlbumWithSongsViewModel.example())
    }
}
