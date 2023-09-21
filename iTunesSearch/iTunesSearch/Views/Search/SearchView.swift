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
                
                Spacer()
            }
            .searchable(text: $searchTerm).autocorrectionDisabled()
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
