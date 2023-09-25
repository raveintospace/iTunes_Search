//
//  Album.swift
//  iTunesSearch
//
//  Created by Uri on 16/9/23.
//

import Foundation

// MARK: - AlbumResult
struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

// MARK: - Result
struct Album: Codable, Identifiable {
    let id: Int
    let wrapperType, collectionType: String
    let artistID: Int
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL: String?
    let collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let collectionExplicitness: String
    let trackCount: Int
    let copyright: String?
    let country, currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case id = "collectionId"            // custom, transforming collectionId from json to our id
        case artistID = "artistId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
    
    static func albumExample() -> Album {
        Album(id: 1, wrapperType: "collection", collectionType: "Album", artistID: 2, amgArtistID: 3, artistName: "Headhunterz", collectionName: "Project One", collectionCensoredName: "Project One", artistViewURL: "", collectionViewURL: "https://music.apple.com/us/album/project-one/284145247?uo=4",
              artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music113/v4/97/47/a0/9747a0ea-c569-dc66-a962-6bd70c5c41a4/8717825532785.png/60x60bb.jpg",
              artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music113/v4/97/47/a0/9747a0ea-c569-dc66-a962-6bd70c5c41a4/8717825532785.png/100x100bb.jpg", collectionPrice: 9.99, collectionExplicitness: "", trackCount: 13, copyright: "", country: "USA", currency: "USD", releaseDate: "2008-07-15T07:00:00Z", primaryGenreName: "Hardstyle")
    }
}
