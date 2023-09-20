//
//  MovieSearchView.swift
//  iTunesSearch
//
//  Created by Uri on 19/9/23.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    MoviePlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
        }
    }
}

struct MoviePlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Clint Eastwood", "Julia Roberts", "Martin Scorsese", "Ryan Gosling", "Woody Allen"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending movie artists")
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

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
