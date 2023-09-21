//
//  SearchAllListView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    Text("Songs")
                    Spacer()
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                
                HStack {
                    Text("Movies")
                    Spacer()
                    NavigationLink {
                        MovieListView(viewModel: movieListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                MovieSectionView(movies: movieListViewModel.movies)
                                
                Text("Albums: \(albumListViewModel.albums.count)")
                Text("Movies: \(movieListViewModel.movies.count)")
                Text("Songs: \(songListViewModel.songs.count)")
            }
        }
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel.example(),
                          movieListViewModel: MovieListViewModel.example(), songListViewModel: SongListViewModel.example())
    }
}
