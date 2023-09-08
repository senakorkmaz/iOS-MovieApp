//
//  DetailModelView.swift
//  Movie
//
//  Created by Senanur Korkmaz on 8.09.2023.
//

import Foundation

class DetailViewModel: ObservableObject {
    let movie: Movie
    let sections: [DetailViewSection] = [.about,.review]
    @Published var selectedSection: DetailViewSection = .about
    
    init(movie: Movie){
        self.movie = movie
    }
}
