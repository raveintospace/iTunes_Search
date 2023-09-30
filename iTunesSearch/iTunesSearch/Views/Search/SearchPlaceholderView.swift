//
//  SearchPlaceholderView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SearchPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Clint Eastwood", "Martin Scorsese", "Phuture Noize", "Thunderdome", "Vertile"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("text-trendingArtists")
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

struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("Roxette"))
    }
}
