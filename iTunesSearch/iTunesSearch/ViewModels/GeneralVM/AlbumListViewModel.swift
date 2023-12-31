//
//  AlbumListViewModel.swift
//  iTunesSearch
//  https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
//  Created by Uri on 16/9/23.
//

import Foundation
import Combine

class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    let resultsLimit = 20
    var currentPage = 0
    
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .removeDuplicates()     // avoid searching the same string if it's passed twice
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // run search every 0.5 seconds
            .sink { [weak self] term in
                guard let self = self else { return }
                self.clearForSink()
                self.fetchAlbums(searchTerm: term)
            }.store(in: &cancellableBag)
    }
    
    func clearForSink() {
        state = .good
        currentPage = 0
        albums = []       // clean array with previous results
    }
    
    func fetchAlbums(searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        guard state == .good else { return }
        
        state = .isLoading
        
        apiService.fetchAlbums(searchTerm: searchTerm, currentPage: currentPage, resultsLimit: resultsLimit) {
            [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    for album in results.results {
                        self.albums.append(album)
                    }
                    self.currentPage += 1
                    debugPrint("Fetched albums: \(self.albums.count)")
                    
                    // if we get less albums in Api call than resultsLimit
                    self.state = (results.results.count == self.resultsLimit) ? .good : .loadedAll
                    
                case .failure(let error):
                    debugPrint("Could not load: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchMoreAlbums() {
        fetchAlbums(searchTerm: searchTerm)
    }
    
    // lesson 5 - used for preview
    static func example() -> AlbumListViewModel {
        let vm = AlbumListViewModel()
        vm.albums = [Album.albumExample()]
        return vm
    }
}
