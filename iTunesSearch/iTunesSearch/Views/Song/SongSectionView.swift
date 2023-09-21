//
//  SongSectionView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SongSectionView: View {
    let songs: [Song]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(songs) { song in
                    Text(song.trackName)
                }
            }
        }
    }
}

struct SongSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SongSectionView(songs: [Song.songExample()])
    }
}
