//
//  APIService.swift
//  iTunesSearch
//
//  Created by Uri on 17/9/23.
//

import Foundation

enum EntityType: String {
    case album
    case movie
    case song
}

class APIService {
    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }
    
    // MARK: - Solves multi words searchTerms
    func createURL(searchTerm: String, entityType: EntityType, currentPage: Int, resultsLimit: Int) -> URL? {
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

    // MARK: - Fetch albums
    func fetchAlbums(searchTerm: String,
                     currentPage: Int,
                     resultsLimit: Int,
                     completion: @escaping (Result<AlbumResult, APIError>) -> Void) {
        
        let url = createURL(searchTerm: searchTerm, entityType: .album, currentPage: currentPage, resultsLimit: resultsLimit)
        
        fetch(type: AlbumResult.self, url: url, completion: completion)
    }
    
    // MARK: - Fetch movies
    func fetchMovies(searchTerm: String,
                    currentPage: Int,
                    resultsLimit: Int,
                    completion: @escaping (Result<MovieResult, APIError>) -> Void) {
       
        let url = createURL(searchTerm: searchTerm, entityType: .movie, currentPage: currentPage, resultsLimit: resultsLimit)
       
       fetch(type: MovieResult.self, url: url, completion: completion)
   }
    
    // MARK: - Fetch songs
    func fetchSongs(searchTerm: String,
                    currentPage: Int,
                    resultsLimit: Int,
                    completion: @escaping (Result<SongResult, APIError>) -> Void) {
       
        let url = createURL(searchTerm: searchTerm, entityType: .song, currentPage: currentPage, resultsLimit: resultsLimit)
       
       fetch(type: SongResult.self, url: url, completion: completion)
   }
}
