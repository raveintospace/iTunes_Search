//
//  SongListViewModel.swift
//  iTunesSearch
//   https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
//  Created by Uri on 19/9/23.
//

import Foundation
import Combine

class SongListViewModel: ObservableObject {
   
    @Published var songs: [Song] = [Song]()
    @Published var searchTerm: String = ""
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    let resultsLimit = 20
    var currentPage = 0
    
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // run search every 0.5 seconds
            .sink { [weak self] term in
                guard let self = self else { return }
                self.clearForSink()
                self.fetchSongs(searchTerm: term)
            }.store(in: &cancellableBag)
    }
    
    func clearForSink() {
        state = .good
        currentPage = 0
        songs = []       // clean array with previous results
    }
    
    func fetchSongs(searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        guard state == .good else { return }
        
        state = .isLoading
        
        apiService.fetchSongs(searchTerm: searchTerm, currentPage: currentPage, resultsLimit: resultsLimit) {
            [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    for song in results.results {
                        self.songs.append(song)
                    }
                    self.currentPage += 1
                    debugPrint("Fetched songs: \(self.songs.count)")
                    
                    // if we get less albums in Api call than resultsLimit
                    self.state = (results.results.count == self.resultsLimit) ? .good : .loadedAll
                    
                case .failure(let error):
                    debugPrint("Could not load: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchMoreSongs() {
        fetchSongs(searchTerm: searchTerm)
    }
}
