//
//  AlbumHeaderDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import SwiftUI

struct AlbumHeaderDetailView: View {
    let album: Album
    
    var body: some View {
        HStack(alignment: .bottom) {
            ObjectImageView(urlString: album.artworkUrl100, size: 100)
            VStack(alignment: .leading) {
                Text(album.collectionName)
                    .font(.footnote)
                    .foregroundColor(Color(.label))
                    .offset(y: -15)
                Text(album.artistName)
                    .padding(.bottom, 5)
                    .offset(y: -15)
                
                Text(album.primaryGenreName)
                Text("\(album.trackCount) text-songs")
                Text("text-released \(formattedDate(value: album.releaseDate))")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .lineLimit(1)
            
            Spacer(minLength: 20)
            BuyButton(urlString: album.collectionViewURL, price: album.collectionPrice, currency: album.currency)
        }
        .padding()
        .background(
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 5))
    }
}

struct AlbumHeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumHeaderDetailView(album: Album.albumExample())
    }
}
