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
        // ScrollViewReader scrolls view programmatically to selected element
        ScrollViewReader { proxy in
            ScrollView {
                if albumWithSongsViewModel.state == .isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if albumWithSongsViewModel.songsInAlbum.count > 0 {
                    SongGridView(songs: albumWithSongsViewModel.songsInAlbum, selectedSong: selectedSong)
                        .onAppear {
                            proxy.scrollTo(selectedSong?.trackNumber, anchor: .center)
                        }
                }
            }
        }
    }
}

struct AlbumWithSongsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumWithSongsView(albumWithSongsViewModel: AlbumWithSongsViewModel.example(), selectedSong: nil)
    }
}
