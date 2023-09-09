//
//  PreviewProvider.swift
//  Movie
//
//  Created by Ahmed Ali on 19/04/2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let movie = Movie(
        adult: false,
        backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
        genreIDS: [
            18,
            80
        ],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 127.43,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.7,
        voteCount: 18570
    )
    
    
    let genre = Genre(id: 28, name: "Action")
    
    let review = Review(author: "Test Author", authorDetails: nil, content: "Test content", createdAt: "2023", id: "Test", updatedAt: "Test", url: "Test")
    
}
