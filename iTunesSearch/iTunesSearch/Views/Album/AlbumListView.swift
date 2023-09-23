//
//  AlbumListView.swift
//  iTunesSearch
//
//  Created by Uri on 16/9/23.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.albums) { album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    AlbumRowView(album: album)
                }
            }
            
            switch viewModel.state {
            case .good:
                Color.clear
                    .onAppear {
                        viewModel.fetchMoreAlbums()
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

// NavigationView in preview allows to see it properly
struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumListView(viewModel: AlbumListViewModel.example())
        }
    }
}
