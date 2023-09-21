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
        VStack {
            Text("Albums: \(albumListViewModel.albums.count)")
            Text("Movies: \(movieListViewModel.movies.count)")
            Text("Songs: \(songListViewModel.songs.count)")
        }
    }
}

//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchAllListView()
//    }
//}
