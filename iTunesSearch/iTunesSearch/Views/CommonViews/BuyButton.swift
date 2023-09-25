//
//  BuyButton.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct BuyButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let url = URL(string: urlString),
            let priceText = formattedPrice() {
            Link(destination: url) {
                Text(priceText)
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
    
    func formattedPrice() -> String? {
        guard let price = price else { return nil }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        
        let priceString = formatter.string(from: NSNumber(value: price))
        return priceString ?? ""
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        let example = Song.songExample()
        
        BuyButton(urlString: example.collectionViewURL, price: example.trackPrice, currency: example.currency)
    }
}
