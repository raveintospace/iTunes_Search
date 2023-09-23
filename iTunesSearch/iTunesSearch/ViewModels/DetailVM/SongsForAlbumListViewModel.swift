//
//  SongsForAlbumListViewModel.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    
    let albumId: Int
    @Published var songsInAlbum = [Song]()
    
    init(albumID: Int) {
        self.albumId = albumID
    }
    
    func fetchSongs(albumId: Int) {
        
    }
}
