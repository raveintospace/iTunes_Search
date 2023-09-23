//
//  SongsForAlbumListViewModel.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import Foundation

class AlbumWithSongsViewModel: ObservableObject {
    
    let albumId: Int
    @Published var songsInAlbum = [Song]()
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    init(albumID: Int) {
        self.albumId = albumID
    }
    
    func fetchSongsForAlbumDetail(albumId: Int) {
        apiService.fetchSongsForAlbumDetail(albumId: albumId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    self.songsInAlbum = results.results
                    self.state = .good
                    
                case .failure(let error):
                    debugPrint("Could not load: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
