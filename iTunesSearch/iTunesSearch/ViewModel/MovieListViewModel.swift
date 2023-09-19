//
//  MovieListViewModel.swift
//  iTunesSearch
//
//  Created by Uri on 19/9/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
   
    @Published var movies: [Movie] = [Movie]()
    @Published var searchTerm: String = ""
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    let resultsLimit = 20
    var currentPage = 0
    
    var cancellableBag = Set<AnyCancellable>()
    
    func fetchMovies(searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        guard state == .good else { return }
        
        state = .isLoading
        
        apiService.fetchMovies(searchTerm: searchTerm, currentPage: currentPage, resultsLimit: resultsLimit) {
            [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    for movie in results.results {
                        self.movies.append(movie)
                    }
                    self.currentPage += 1
                    debugPrint(self.movies.count)
                    
                    // if we get less albums in Api call than resultsLimit
                    self.state = (results.results.count == self.resultsLimit) ? .good : .loadedAll
                    
                case .failure(let error):
                    self.state = .error("Could not load: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func fetchMoreMovies() {
        fetchMovies(searchTerm: searchTerm)
    }
}
