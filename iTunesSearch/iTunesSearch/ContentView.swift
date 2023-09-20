//
//  ContentView.swift
//  iTunesSearch
//  https://www.youtube.com/watch?v=LT0cawkgXqM&t=0s
//  Created by Uri on 16/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note")
                }
            MovieSearchView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
                }
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
