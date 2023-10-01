//
//  MovieAboutDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 1/10/23.
//

import SwiftUI
import ExpandableText

struct MovieAboutDetailView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            Text("text-about")
                .font(.title3)
                .bold()
                .padding(.bottom, 2)
            if let longDescription = movie.longDescription {
                ExpandableText(longDescription)
            } else {
                Text("text-noLongDescription")
            }
        }
        .padding(.horizontal)
    }
}

struct MovieAboutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieAboutDetailView(movie: Movie.movieExample())
    }
}
