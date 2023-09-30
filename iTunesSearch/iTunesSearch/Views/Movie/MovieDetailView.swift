//
//  MovieDetailView.swift
//  iTunesSearch
//
//  Created by Uri on 30/9/23.
//

import SwiftUI
import ExpandableText

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            MovieHeaderDetailView(movie: movie)
            Divider()
            VStack(alignment: .leading) {
                Text("About the film")
                    .font(.title3)
                    .bold()
                ScrollView {
                    ExpandableText("Considered among the best films of all time, Martin Scorsese's Taxi Driver was nominated for Academy Awards® for Best Picture, Best Actor (Robert De Niro), Best Supporting Actress (Jodie Foster) and Best Original Score (Bernard Herrmann). Solitary, alienated, and emotionally scarred from Vietnam, taxi driver Travis Bickle (De Niro) works the night shift in Manhattan.Though the world around him is teeming with life, Travis is unable to connect with anyone. His date with Betsy (Cybill Shepherd), a beautiful campaign aide, fails when he takes her to a porno movie. He tries to save a 12-year-old prostitute, Iris (Foster), from her pimp, Sport (Harvey Keitel) - though it's unclear Iris wants to be saved. Travis's pent-up anger and misplaced loyalty finally boil over in a paroxysm of revenge and violence.")
                }
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.movieExample())
    }
}
