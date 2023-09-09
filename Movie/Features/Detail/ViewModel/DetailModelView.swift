//
//  DetailModelView.swift
//  Movie
//
//  Created by Senanur Korkmaz on 8.09.2023.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    let movie: Movie
    let sections: [DetailViewSection] = [.about,.review]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    private let movieService = MovieService()
    
    init(movie: Movie){
        self.movie = movie
    }
    
    func fetchReview() async{
        do{
            let response: ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            reviews = response.results
        }catch{
            print("Error \(error)")
        }
    }
}
