//
//  SearchView.swift
//  iTunesSearch
//
//  Created by Uri on 20/9/23.
//

import SwiftUI

struct SearchView: View {
    @State private var selectedEntityType = EntityType.all
    @State private var searchTerm = ""
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.generateName())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                if searchTerm.count == 0 {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                    
                } else {
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel,
                                          movieListViewModel: movieListViewModel, songListViewModel: songListViewModel)
                        .onAppear {
                            albumListViewModel.searchTerm = searchTerm
                            movieListViewModel.searchTerm = searchTerm
                            songListViewModel.searchTerm = searchTerm
                        }
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                            .onAppear {
                                albumListViewModel.searchTerm = searchTerm
                            }
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                            .onAppear {
                                movieListViewModel.searchTerm = searchTerm
                            }
                    case .song:
                        SongListView(viewModel: songListViewModel)
                            .onAppear {
                                songListViewModel.searchTerm = searchTerm
                            }
                    }
                }
            }
            .searchable(text: $searchTerm).autocorrectionDisabled()
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: searchTerm) { newValue in
            
            switch selectedEntityType {
            case .all:
                albumListViewModel.searchTerm = newValue
                movieListViewModel.searchTerm = newValue
                songListViewModel.searchTerm = newValue
            case .album:
                albumListViewModel.searchTerm = newValue
            case .movie:
                movieListViewModel.searchTerm = newValue
            case .song:
                songListViewModel.searchTerm = newValue
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
