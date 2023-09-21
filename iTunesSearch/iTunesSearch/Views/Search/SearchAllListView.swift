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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchAllListView()
//    }
//}
