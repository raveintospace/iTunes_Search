//
//  SongImageView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct SongImageView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 60, height: 60)
    }
}

struct SongImageView_Previews: PreviewProvider {
    static var previews: some View {
        SongImageView(urlString: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/31/d3/88/31d38806-7a6c-9002-99ce-87a00ed07046/8719244860449.png/60x60bb.jpg")
    }
}
