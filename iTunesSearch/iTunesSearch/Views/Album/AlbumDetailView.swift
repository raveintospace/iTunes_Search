//
//  AlbumDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    var body: some View {
        HStack {
            ObjectImageView(urlString: album.artworkUrl100, size: 100)
            VStack(alignment: .leading) {
                Text(album.collectionName)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(album.primaryGenreName)
                Text("\(album.trackCount) songs")
                Text("Released: \(formattedDate(value: album.releaseDate))")
            }
            .lineLimit(1)
            
            Spacer(minLength: 20)
            BuyButton(urlString: album.collectionViewURL, price: album.collectionPrice, currency: album.currency)
        }

    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.albumExample())
    }
}
