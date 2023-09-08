//
//  MovieCard.swift
//  Movie
//
//  Created by Senanur Korkmaz on 6.09.2023.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieCardType = .poster
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard{
    var itemWidth: CGFloat{
        screenWidth * type.widthPercent
    }
    
    var itemHeight: CGFloat{
        screenHeight * type.heightPercent
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            MovieCard(movie: dev.movie)
            MovieCard(movie: dev.movie,type: .grid)
        }
       
    }
}
