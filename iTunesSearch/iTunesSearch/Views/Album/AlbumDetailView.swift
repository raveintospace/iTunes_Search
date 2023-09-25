//
//  AlbumDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    @StateObject var albumWithSongsViewModel: AlbumWithSongsViewModel
    
    init(album: Album) {
        self.album = album
        self._albumWithSongsViewModel = StateObject(wrappedValue: AlbumWithSongsViewModel(albumId: album.id))
    }
    
    var body: some View {
        VStack {
            AlbumHeaderDetailView(album: album)
            
            AlbumWithSongsView(albumWithSongsViewModel: albumWithSongsViewModel)
        }
        .onAppear {
            albumWithSongsViewModel.fetch()
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.albumExample())
    }
}
