//
//  Movie.swift
//  iTunesSearch
//
//  Created by Uri on 16/9/23.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let wrapperType, kind: String
    let artistID: Int?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription: String?
    let longDescription: String?
    
    var id: Int {
        return trackID
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }
    
    static func movieExample() -> Movie {
        Movie(wrapperType: "track", kind: "feature-movie", artistID: 1, trackID: 543685056, artistName: "Martin Scorsese", trackName: "Taxi Driver", trackCensoredName: "", artistViewURL: nil, trackViewURL: "https://itunes.apple.com/us/movie/taxi-driver/id543685056?uo=4", previewURL: nil, artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/100x100bb.jpg", collectionPrice: 12.99, trackPrice: 12.99, trackRentalPrice: 3.99, collectionHDPrice: 14.99, trackHDPrice: 14.99, trackHDRentalPrice: 3.99, releaseDate: "1976-03-04T08:00:00Z", collectionExplicitness: "", trackExplicitness: "", trackTimeMillis: 6837997, country: "USA", currency: "USD", primaryGenreName: "Drama", contentAdvisoryRating: "R", shortDescription: "A taxi driver in NY", longDescription: "Considered among the best films of all time, Martin Scorsese's Taxi Driver was nominated for Academy Awards® for Best Picture, Best Actor (Robert De Niro), Best Supporting Actress (Jodie Foster) and Best Original Score (Bernard Herrmann). Solitary, alienated, and emotionally scarred from Vietnam, taxi driver Travis Bickle (De Niro) works the night shift in Manhattan.Though the world around him is teeming with life, Travis is unable to connect with anyone. His date with Betsy (Cybill Shepherd), a beautiful campaign aide, fails when he takes her to a porno movie. He tries to save a 12-year-old prostitute, Iris (Foster), from her pimp, Sport (Harvey Keitel) - though it's unclear Iris wants to be saved. Travis's pent-up anger and misplaced loyalty finally boil over in a paroxysm of revenge and violence.")
    }
}
