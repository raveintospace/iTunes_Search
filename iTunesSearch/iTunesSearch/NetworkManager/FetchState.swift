//
//  FetchState.swift
//  iTunesSearch
//
//  Created by Uri on 19/9/23.
//

import Foundation

// enum to check status when calling api
enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
