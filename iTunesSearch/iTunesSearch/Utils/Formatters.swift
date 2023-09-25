//
//  Formatters.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import Foundation

// MARK: - Date from Api comes in format 2008-07-15T07:00:00Z
func formattedDate(value: String) -> String {
    let dateFormatterGetter = DateFormatter()
    dateFormatterGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    
    guard let date = dateFormatterGetter.date(from: value) else {
        return ""
    }
    
    // use date format from user device
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.dateStyle = .medium
    dateFormatter.timeZone = .none
    
    return dateFormatter.string(from: date)
}

// MARK: - Song duration from API comes in milliseconds
func formattedDuration(time: Int) -> String {
    let timeInSeconds = time / 1000
    let interval = TimeInterval(timeInSeconds)
    let formatter = DateComponentsFormatter()
    formatter.zeroFormattingBehavior = .pad
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    
    return formatter.string(from: interval) ?? ""
}
