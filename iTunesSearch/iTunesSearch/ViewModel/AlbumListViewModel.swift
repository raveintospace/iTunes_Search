//
//  AlbumListViewModel.swift
//  iTunesSearch
//
//  Created by Uri on 16/9/23.
//

import Foundation
import Combine

// MARK: - URL examples
/*
 https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
 https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
 https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5
 */

class AlbumListViewModel: ObservableObject {
    
    // enum to check status when calling api
    enum State: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }
    
    enum EntityType: String {
        case album
        case movie
        case song
    }
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: State = .good
    
    let resultsLimit = 20
    var currentPage = 0
    
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // run search every 0.5 seconds
            .sink { [weak self] term in
                self?.state = .good
                self?.currentPage = 0
                self?.albums = []       // clean array with previous results
                self?.fetchAlbums(searchTerm: term)
            }.store(in: &cancellableBag)
    }
    
    func fetchAlbums(searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        guard state == .good else { return }
        
        guard let url = createURL(searchTerm: searchTerm) else {
            return
        }
        
        state = .isLoading
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                debugPrint("URLSession error: \(error.localizedDescription)")
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        for album in result.results {
                            self.albums.append(album)
                        }
                        self.currentPage += 1
                        debugPrint(self.albums.count)
                        
                        // if we get less albums in Api call than resultsLimit
                        self.state = (result.results.count == resultsLimit) ? .good : .loadedAll
                    }
                } catch {
                    debugPrint("Decoding error: \(error.localizedDescription)")
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.state = .error("Could not get data: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
    
    func fetchMore() {
        fetchAlbums(searchTerm: searchTerm)
    }
    
    // solves multi words searchTerms
    func createURL(searchTerm: String, entityType: EntityType = .album) -> URL? {
        // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5

        let offset = currentPage * resultsLimit
        
        let baseURL = "https://itunes.apple.com/search"
        let queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: entityType.rawValue),
                          URLQueryItem(name: "limit", value: String(resultsLimit)),
                          URLQueryItem(name: "offset", value: String(offset))]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
