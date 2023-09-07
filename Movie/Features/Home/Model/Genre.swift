//
//  Genre.swift
//  Movie
//
//  Created by Senanur Korkmaz on 7.09.2023.
//

import Foundation


struct Genre: Identifiable, Codable{
    let id: Int
    let name: String
}

struct GenreResponse: Codable{
    let genres: [Genre]
}
