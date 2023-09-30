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
    
    init(wrapperType: String, kind: String, artistID: Int?, trackID: Int, artistName: String, trackName: String, trackCensoredName: String, artistViewURL: String?, trackViewURL: String, previewURL: String?, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double?, trackPrice: Double?, trackRentalPrice: Double?, collectionHDPrice: Double?, trackHDPrice: Double?, trackHDRentalPrice: Double?, releaseDate: String, collectionExplicitness: String, trackExplicitness: String, trackTimeMillis: Int?, country: String, currency: String, primaryGenreName: String, contentAdvisoryRating: String, shortDescription: String?, longDescription: String?) {
        self.wrapperType = wrapperType
        self.kind = kind
        self.artistID = artistID
        self.trackID = trackID
        self.artistName = artistName
        self.trackName = trackName
        self.trackCensoredName = trackCensoredName
        self.artistViewURL = artistViewURL
        self.trackViewURL = trackViewURL
        self.previewURL = previewURL
        self.artworkUrl30 = artworkUrl30
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.trackPrice = trackPrice
        self.trackRentalPrice = trackRentalPrice
        self.collectionHDPrice = collectionHDPrice
        self.trackHDPrice = trackHDPrice
        self.trackHDRentalPrice = trackHDRentalPrice
        self.releaseDate = releaseDate
        self.collectionExplicitness = collectionExplicitness
        self.trackExplicitness = trackExplicitness
        self.trackTimeMillis = trackTimeMillis
        self.country = country
        self.currency = currency
        self.primaryGenreName = primaryGenreName
        self.contentAdvisoryRating = contentAdvisoryRating
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wrapperType = try container.decode(String.self, forKey: .wrapperType)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.artistID = try container.decodeIfPresent(Int.self, forKey: .artistID)
        self.trackID = try container.decode(Int.self, forKey: .trackID)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.trackCensoredName = try container.decode(String.self, forKey: .trackCensoredName)
        self.artistViewURL = try container.decodeIfPresent(String.self, forKey: .artistViewURL)
        self.trackViewURL = try container.decode(String.self, forKey: .trackViewURL)
        self.previewURL = try container.decodeIfPresent(String.self, forKey: .previewURL)
        self.artworkUrl30 = try container.decode(String.self, forKey: .artworkUrl30)
        self.artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
        self.artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
        self.collectionPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
        self.trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
        self.trackRentalPrice = try container.decodeIfPresent(Double.self, forKey: .trackRentalPrice)
        self.collectionHDPrice = try container.decodeIfPresent(Double.self, forKey: .collectionHDPrice)
        self.trackHDPrice = try container.decodeIfPresent(Double.self, forKey: .trackHDPrice)
        self.trackHDRentalPrice = try container.decodeIfPresent(Double.self, forKey: .trackHDRentalPrice)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.collectionExplicitness = try container.decode(String.self, forKey: .collectionExplicitness)
        self.trackExplicitness = try container.decode(String.self, forKey: .trackExplicitness)
        self.trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        self.country = try container.decode(String.self, forKey: .country)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
        self.contentAdvisoryRating = try container.decode(String.self, forKey: .contentAdvisoryRating)
        self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.longDescription = try container.decodeIfPresent(String.self, forKey: .longDescription) ?? "No available description"
    }
    
    static func movieExample() -> Movie {
        Movie(wrapperType: "track", kind: "feature-movie", artistID: 1, trackID: 543685056, artistName: "Martin Scorsese", trackName: "Taxi Driver", trackCensoredName: "", artistViewURL: nil, trackViewURL: "https://itunes.apple.com/us/movie/taxi-driver/id543685056?uo=4", previewURL: nil, artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video62/v4/e3/b3/31/e3b331be-6f62-2048-d449-9e76848a0bf7/pr_source.lsr/100x100bb.jpg", collectionPrice: 12.99, trackPrice: 12.99, trackRentalPrice: 3.99, collectionHDPrice: 14.99, trackHDPrice: 14.99, trackHDRentalPrice: 3.99, releaseDate: "1976-03-04T08:00:00Z", collectionExplicitness: "", trackExplicitness: "", trackTimeMillis: 6837997, country: "USA", currency: "USD", primaryGenreName: "Drama", contentAdvisoryRating: "R", shortDescription: "A taxi driver in NY", longDescription: "Considered among the best films of all time, Martin Scorsese's Taxi Driver was nominated for Academy Awards® for Best Picture, Best Actor (Robert De Niro), Best Supporting Actress (Jodie Foster) and Best Original Score (Bernard Herrmann). Solitary, alienated, and emotionally scarred from Vietnam, taxi driver Travis Bickle (De Niro) works the night shift in Manhattan.Though the world around him is teeming with life, Travis is unable to connect with anyone. His date with Betsy (Cybill Shepherd), a beautiful campaign aide, fails when he takes her to a porno movie. He tries to save a 12-year-old prostitute, Iris (Foster), from her pimp, Sport (Harvey Keitel) - though it's unclear Iris wants to be saved. Travis's pent-up anger and misplaced loyalty finally boil over in a paroxysm of revenge and violence.")
    }
}
