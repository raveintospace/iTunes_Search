//
//  AlbumSectionView.swift
//  iTunesSearch
//  Called in SearchAllListView
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct AlbumSectionView: View {
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums) { album in
                    NavigationLink {
                        AlbumDetailView(album: album)
                    } label: {
                        VStack(alignment: .leading) {
                            ObjectImageView(urlString: album.artworkUrl100, size: 100)
                            Text(album.collectionName)
                                .multilineTextAlignment(.leading)
                            Text(album.artistName)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .lineLimit(2)
                        .frame(width: 100)
                        .font(.caption)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: [Album.albumExample()])
    }
}

/*
 NavigationLink {
     SongDetailView(song: song)
 } label: {
     SongRowView(song: song)
         .frame(width: 300)
 }
 .buttonStyle(.plain)
 */
