//
//  Song.swift
//  iTunesSearch
//  https://youtu.be/QFQSrBsYxmU?si=_ehyJJrCsq03ybL6 - MIN 40 decoder
//  Created by Uri on 16/9/23.
//

import Foundation

// MARK: - SongResult
struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable, Identifiable, Equatable {
    let wrapperType: String
    let artistID, collectionID: Int
    let id: Int
    let artistName, collectionName, trackName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double?
    let releaseDate: String
    let trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, collectionArtistName
    }
    
    init(wrapperType: String, artistID: Int, collectionID: Int, id: Int, artistName: String, collectionName: String,
             trackName: String, artistViewURL: String, collectionViewURL: String, trackViewURL: String, previewURL: String,
             artworkUrl30: String, artworkUrl60: String, artworkUrl100: String,
             collectionPrice: Double?, trackPrice: Double?, releaseDate: String, trackCount: Int, trackNumber: Int,
             trackTimeMillis: Int, country: String, currency: String, primaryGenreName: String, collectionArtistName: String?) {
            self.wrapperType = wrapperType
            self.id = id
            self.artistID = artistID
            self.collectionID = collectionID
            self.collectionName = collectionName
            self.collectionViewURL = collectionViewURL
            self.collectionArtistName = collectionArtistName
            self.previewURL = previewURL
            
            self.collectionPrice = collectionPrice
            self.trackPrice = trackPrice
            self.currency = currency
            self.country = country
            self.primaryGenreName = primaryGenreName
            
            self.artworkUrl30 = artworkUrl30
            self.artworkUrl60 = artworkUrl60
            self.artworkUrl100 = artworkUrl100
            self.artistViewURL = artistViewURL
            self.artistName = artistName
            
            self.trackName = trackName
            self.trackCount = trackCount
            self.trackNumber = trackNumber
            self.trackTimeMillis = trackTimeMillis
            self.trackViewURL = trackViewURL
            self.releaseDate = releaseDate
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wrapperType = try container.decode(String.self, forKey: .wrapperType)
        self.artistID = try container.decode(Int.self, forKey: .artistID)
        self.collectionID = try container.decode(Int.self, forKey: .collectionID)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.collectionName = try container.decode(String.self, forKey: .collectionName)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
        self.artistViewURL = try container.decodeIfPresent(String.self, forKey: .artistViewURL) ?? ""
        self.collectionViewURL = try container.decode(String.self, forKey: .collectionViewURL)
        self.trackViewURL = try container.decodeIfPresent(String.self, forKey: .trackViewURL) ?? ""
        self.previewURL = try container.decodeIfPresent(String.self, forKey: .previewURL) ?? ""
        self.artworkUrl30 = try container.decodeIfPresent(String.self, forKey: .artworkUrl30) ?? ""
        self.artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
        self.artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
        self.collectionPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
        self.trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.trackCount = try container.decode(Int.self, forKey: .trackCount)
        self.trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber) ?? 1
        self.trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? 1
        self.country = try container.decode(String.self, forKey: .country)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
        self.collectionArtistName = try container.decodeIfPresent(String.self, forKey: .collectionArtistName)
    }
    
    static func songExample() -> Song {
        Song(wrapperType: "Song", artistID: 1, collectionID: 1, id: 1, artistName: "Phuture Noize", collectionName: "From Star to Stardust - Single", trackName: "From Star to Stardust", artistViewURL: "", collectionViewURL: "",
             trackViewURL: "https://music.apple.com/us/album/from-star-to-stardust-extended-mix/1670290189?i=1670290191&uo=4",
             previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/16/7d/6b/167d6bf3-5f07-ad2a-5efd-72ac6892d636/mzaf_10900782558649856545.plus.aac.p.m4a",
             artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/30x30bb.jpg",
             artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/60x60bb.jpg",
             artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/100x100bb.jpg",
             collectionPrice: 9.88, trackPrice: 1.29, releaseDate: "2023-02-22T12:00:00Z", trackCount: 14, trackNumber: 1, trackTimeMillis: 208643, country: "USA", currency: "USD", primaryGenreName: "Hardstyle", collectionArtistName: nil)
    }
    
    static func songExampleTwo() -> Song {
        Song(wrapperType: "Song",
             artistID: 1, collectionID: 1, id: 10, artistName: "Phuture Noize",
             collectionName: "From Star to Stardust - Single", trackName: "Outro", artistViewURL: "", collectionViewURL: "",
             trackViewURL: "https://music.apple.com/us/album/from-star-to-stardust-extended-mix/1670290189?i=1670290191&uo=4",
             previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/16/7d/6b/167d6bf3-5f07-ad2a-5efd-72ac6892d636/mzaf_10900782558649856545.plus.aac.p.m4a",
             artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/30x30bb.jpg",
             artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/60x60bb.jpg",
             artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/100x100bb.jpg",
             collectionPrice: 9.88, trackPrice: 0.99, releaseDate: "2023-02-22T12:00:00Z", trackCount: 14, trackNumber: 10, trackTimeMillis: 108643, country: "USA", currency: "USD", primaryGenreName: "Hardstyle", collectionArtistName: nil)
    }
}
