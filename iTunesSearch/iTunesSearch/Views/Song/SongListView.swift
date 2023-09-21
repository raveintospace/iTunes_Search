//
//  SongListView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SongListView: View {
    @ObservedObject var viewModel: SongListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.songs) { song in
                HStack {
                    AsyncImage(url: URL(string: song.artworkUrl60)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text(song.trackName)
                        Text(song.artistName + " - " + song.collectionName)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .lineLimit(1)
                    
                    if let url = URL(string: song.trackViewURL), let price = song.trackPrice {
                        Link(destination: url) {
                            Text("\(Int(price)) \(song.currency)")
                        }
                    }
                }
            }
            
            switch viewModel.state {
            case .good:
                Color.clear
                    .onAppear {
                        viewModel.fetchMoreSongs()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                EmptyView()
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
            }
        }
        .listStyle(.plain)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.example())
    }
}
