//
//  AlbumDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 23/9/23.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    @StateObject var albumWithSongsViewModel: AlbumWithSongsViewModel
    
    init(album: Album) {
        self.album = album
        self._albumWithSongsViewModel = StateObject(wrappedValue: AlbumWithSongsViewModel(albumID: album.id))
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                ObjectImageView(urlString: album.artworkUrl100, size: 100)
                VStack(alignment: .leading) {
                    Text(album.collectionName)
                        .font(.footnote)
                        .foregroundColor(Color(.label))
                    
                    Text(album.artistName)
                        .padding(.bottom, 5)
                    
                    Text(album.primaryGenreName)
                    Text("\(album.trackCount) songs")
                    Text("Released: \(formattedDate(value: album.releaseDate))")
                }
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
                
                Spacer(minLength: 20)
                BuyButton(urlString: album.collectionViewURL, price: album.collectionPrice, currency: album.currency)
            }
            .padding()
            
            AlbumWithSongsView(albumWithSongsViewModel: albumWithSongsViewModel)
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.albumExample())
    }
}
