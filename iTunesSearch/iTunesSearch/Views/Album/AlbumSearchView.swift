//
//  AlbumSearchView.swift
//  iTunesSearch
//
//  Created by Uri on 17/9/23.
//

import SwiftUI

struct AlbumSearchView: View {
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm).autocorrectionDisabled()
            .navigationTitle("navigation-title-AlbumSearchView")
        }
    }
}

struct AlbumPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["D-Sturb", "Headhunterz", "Phuture Noize", "Rooler", "Vertile"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("text-trendingMusicArtists")
                .font(.largeTitle)
            ForEach(suggestions, id: \.self) { suggestion in
                Button {
                    searchTerm = suggestion
                } label: {
                    Text(suggestion)
                        .font(.title2)
                }
            }
        }
    }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
