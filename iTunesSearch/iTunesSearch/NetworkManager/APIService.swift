//
//  APIService.swift
//  iTunesSearch
//
//  Created by Uri on 17/9/23.
//

import Foundation

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
    func createURL(searchTerm: String, entityType: EntityType, currentPage: Int?, resultsLimit: Int?) -> URL? {
        
        let baseURL = "https://itunes.apple.com/search"
        var queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: entityType.rawValue)]
        
        
        if let currentPage = currentPage, let resultsLimit = resultsLimit {
            let offset = currentPage * resultsLimit
            queryItems.append(URLQueryItem(name: "resultsLimit", value: String(resultsLimit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    // MARK: - Obtain URL for Detail views
    func createDetailURL(id: Int, entityType: EntityType) -> URL? {
        
        let baseURL = "https://itunes.apple.com/lookup"
        var queryItems = [URLQueryItem(name: "id", value: String(id)),
                          URLQueryItem(name: "entity", value: entityType.rawValue)]
        
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
                     completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        
        let url = createURL(searchTerm: searchTerm, entityType: .movie, currentPage: nil, resultsLimit: nil)
        
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
