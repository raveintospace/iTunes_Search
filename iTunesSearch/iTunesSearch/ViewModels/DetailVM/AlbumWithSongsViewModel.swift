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
    
    init(albumId: Int) {
        self.albumId = albumId
    }
    
    func fetch() {
        fetchSongsForAlbumDetail(albumId: albumId)
    }
    
    private func fetchSongsForAlbumDetail(albumId: Int) {
        apiService.fetchSongsForAlbumDetail(albumId: albumId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    
                    // lesson 6 - remove first item to avoid having two #1 as trackNumber
                    var fetchedSongs = results.results
                    
                    if results.resultCount > 0 {
                        _ = fetchedSongs.removeFirst()
                    }
                    
                    self.songsInAlbum = fetchedSongs
                    self.state = .good
                    
                case .failure(let error):
                    debugPrint("Could not load: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> AlbumWithSongsViewModel {
        let vm = AlbumWithSongsViewModel(albumId: 1)
        vm.songsInAlbum = [Song.songExample(), Song.songExampleTwo()]
        return vm
    }
}
