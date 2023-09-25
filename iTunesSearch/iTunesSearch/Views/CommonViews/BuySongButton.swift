//
//  BuySongButton.swift
//  iTunesSearch
//
//  Created by Uri on 25/9/23.
//

import SwiftUI

struct BuySongButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let price = price {
            BuyButton(urlString: urlString, price: price, currency: currency)
        } else {
            Text("Album Only")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct BuySongButton_Previews: PreviewProvider {
    static var previews: some View {
        BuySongButton(urlString: Song.songExample().previewURL, price: 9.99, currency: "USD")
    }
}
