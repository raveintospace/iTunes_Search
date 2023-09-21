//
//  AlbumSectionView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct AlbumSectionView: View {
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(albums) { album in
                    Text(album.collectionName)
                }
            }
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: [Album.albumExample()])
    }
}
