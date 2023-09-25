//
//  SongDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    
    @StateObject var albumWithSongsViewModel: AlbumWithSongsViewModel
    @StateObject var songDetailViewModel = SongDetailViewModel()
    
    init(song: Song) {
        self.song = song
        self._albumWithSongsViewModel = StateObject(wrappedValue: AlbumWithSongsViewModel(albumId: song.collectionID))
    }
    
    var body: some View {
        VStack {
            if let album = songDetailViewModel.album {
                AlbumHeaderDetailView(album: album)
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            AlbumWithSongsView(albumWithSongsViewModel: albumWithSongsViewModel, selectedSong: song)
        }
        .onAppear {
            albumWithSongsViewModel.fetch()
            songDetailViewModel.fetch(song: song)
        }
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song.songExample())
    }
}
