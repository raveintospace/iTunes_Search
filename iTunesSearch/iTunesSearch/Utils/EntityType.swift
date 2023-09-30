//
//  EntityType.swift
//  iTunesSearch
//
//  Created by Uri on 20/9/23.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case movie
    case song
    
    var id: String {
        self.rawValue
    }
    
    // not used with app translated
    func generateName() -> String {
        switch self {
        case .all:
            return "All"
        case .album:
            return "Albums"
        case .movie:
            return "Movies"
        case .song:
            return "Songs"
        }
    }
}
