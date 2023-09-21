//
//  RowImageView.swift
//  iTunesSearch
//
//  Created by Uri on 21/9/23.
//

import SwiftUI

struct RowImageView: View {
    let urlString: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .border(Color(white: 0.8))
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}

struct RowImageView_Previews: PreviewProvider {
    static var previews: some View {
        RowImageView(urlString: "https://is1-ssl.mzstatic.com/image/thumb/Music113/v4/97/47/a0/9747a0ea-c569-dc66-a962-6bd70c5c41a4/8717825532785.png/100x100bb.jpg", size: 100.0)
    }
}
