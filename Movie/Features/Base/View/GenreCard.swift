//
//  GenreCard.swift
//  Movie
//
//  Created by Senanur Korkmaz on 7.09.2023.
//

import SwiftUI

struct GenreCard: View {
    let genre: Genre
    let namespace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18)
            .background(
                ZStack{
                    if selectedGenre.id == genre.id{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.AppGrayColor1)
                            .frame(height: 3)
                            .offset(y: 20)
                    }
                }
            )
            .padding()
    }
}

struct GenreCard_Previews: PreviewProvider {
    static var previews: some View {
        GenreCard(genre: dev.genre, namespace: Namespace().wrappedValue, selectedGenre: .constant(dev.genre))
    }
}
