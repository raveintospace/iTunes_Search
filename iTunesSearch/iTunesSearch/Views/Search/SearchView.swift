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
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                    case .song:
                        SongListView(viewModel: songListViewModel)
                    }
                }
            }
            .searchable(text: $searchTerm).autocorrectionDisabled()
            .navigationTitle("navigation-title-SearchView")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: selectedEntityType, perform: { newValue in
            updateViewModels(searchTerm: searchTerm, selectedEntityType: newValue)
        })
        
        .onChange(of: searchTerm) { newValue in
            updateViewModels(searchTerm: newValue, selectedEntityType: selectedEntityType)
        }
    }
    
    func updateViewModels(searchTerm: String, selectedEntityType: EntityType) {
        switch selectedEntityType {
        case .all:
            albumListViewModel.searchTerm = searchTerm
            movieListViewModel.searchTerm = searchTerm
            songListViewModel.searchTerm = searchTerm
        case .album:
            albumListViewModel.searchTerm = searchTerm
            movieListViewModel.searchTerm = ""
            songListViewModel.searchTerm = ""
        case .movie:
            movieListViewModel.searchTerm = searchTerm
            albumListViewModel.searchTerm = ""
            songListViewModel.searchTerm = ""
        case .song:
            songListViewModel.searchTerm = searchTerm
            albumListViewModel.searchTerm = ""
            movieListViewModel.searchTerm = ""
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
