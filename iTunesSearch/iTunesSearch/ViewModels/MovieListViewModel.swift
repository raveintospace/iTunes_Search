//
//  MovieListViewModel.swift
//  iTunesSearch
//  https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5
//  Created by Uri on 19/9/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
   
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    
    private let apiService = APIService()
    
    var cancellableBag = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)  // run search every 0.5 seconds
            .sink { [weak self] term in
                guard let self = self else { return }
                self.clearForSink()
                self.fetchMovies(searchTerm: term)
            }.store(in: &cancellableBag)
    }
    
    func clearForSink() {
        state = .good
        movies = []       // clean array with previous results
    }
    
    func fetchMovies(searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
        guard state == .good else { return }
        
        state = .isLoading
        
        apiService.fetchMovies(searchTerm: searchTerm) {
            [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let results):
                    self.movies = results.results
                    debugPrint("Fetched movies: \(self.movies.count)")
                    
                    self.state = .good
                    
                case .failure(let error):
                    debugPrint("Could not load: \(error)")
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func fetchMoreMovies() {
        fetchMovies(searchTerm: searchTerm)
    }
}
