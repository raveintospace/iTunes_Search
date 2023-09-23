//
//  Song.swift
//  iTunesSearch
//
//  Created by Uri on 16/9/23.
//

import Foundation

// MARK: - SongResult
struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable, Identifiable {
    let wrapperType, kind: String
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
        case wrapperType, kind
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
    
    static func songExample() -> Song {
        Song(wrapperType: "Song", kind: "", artistID: 1, collectionID: 1, id: 1, artistName: "Phuture Noize", collectionName: "From Star to Stardust - Single", trackName: "From Star to Stardust", artistViewURL: "", collectionViewURL: "",
             trackViewURL: "https://music.apple.com/us/album/from-star-to-stardust-extended-mix/1670290189?i=1670290191&uo=4",
             previewURL: "",
             artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/30x30bb.jpg",
             artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/60x60bb.jpg",
             artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/100x100bb.jpg",
             collectionPrice: 9.88, trackPrice: 1.29, releaseDate: "2023-02-22T12:00:00Z", trackCount: 14, trackNumber: 1, trackTimeMillis: 208643, country: "USA", currency: "USD", primaryGenreName: "Hardstyle", collectionArtistName: nil)
    }
}
