//
//  SearchPlaceholderView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SearchPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["D-Sturb", "Headhunterz", "Phuture Noize", "Rooler", "Vertile"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending music artists")
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
