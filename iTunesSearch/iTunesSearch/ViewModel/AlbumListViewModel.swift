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
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    let resultsLimit = 20
    var pageOffset = 0
    
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // run search every 0.5 seconds
            .sink { [weak self] term in
            self?.fetchAlbums(searchTerm: term)
        }.store(in: &cancellableBag)
    }
    
    func fetchAlbums(searchTerm: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=\(resultsLimit)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                debugPrint("URLSession error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.albums = result.results
                        debugPrint(self.albums.count)
                    }
                } catch {
                    debugPrint("Decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
