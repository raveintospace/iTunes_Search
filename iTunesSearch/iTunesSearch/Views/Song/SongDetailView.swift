//
//  SongDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    
    var body: some View {
        Text(song.trackName)
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song.songExample())
    }
}
