//
//  CustomImageView.swift
//  Movie
//
//  Created by Senanur Korkmaz on 6.09.2023.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    var body: some View {
        AsyncImage(url: URL(string: movie.imageUrlString)){ image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack{
                Color.AppGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(itemWidth: 150, itemHeight: 150, movie: dev.movie)
    }
}
