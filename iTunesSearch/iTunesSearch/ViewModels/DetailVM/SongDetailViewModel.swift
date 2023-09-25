//
//  SongDetailViewModel.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import Foundation

class SongDetailViewModel: ObservableObject {
    
    @Published var album: Album?
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    func fetch(song: Song) {
        let albumId = song.collectionID
        
        state = .isLoading
        
        apiService.fetchAlbumForSongDetailView(albumId: albumId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    let albums = results.results
                    
                    self.album = albums.first
                    self.state = .good
                    
                case .failure(let error):
                    debugPrint("Could not load albumId for SongDetailView: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
