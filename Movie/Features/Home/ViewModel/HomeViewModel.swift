//
//  HomeViewModel.swift
//  Movie
//
//  Created by Senanur Korkmaz on 7.09.2023.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var moviedForSelectedGerne: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var selectedGenre = DeveloperPreview.instance.genre
    @Published var errorMsg = ""
    
    private let movieService = MovieService()
    
    func fetchTrendingMovie() async {
        do{
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            self.trendingMovies = movieApiResponse.results
        }catch{
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchTopRatedMovie() async {
        do{
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            self.topRatedMovies = movieApiResponse.results
        }catch{
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchGenre() async {
        do{
            let genreApiResponse: GenreResponse = try await movieService.fetchData(api: .init(endpoint: .genre))
            self.genre = genreApiResponse.genres
            if let genre = genre.first{
                selectedGenre = genre
            }
        }catch{
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchMovieForSelectedGenre() async {
        do{
            let api = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
            let response: MovieResponse = try await movieService.fetchData(api: api)
            self.moviedForSelectedGerne = response.results
        }catch{
            errorMsg = "Error: \(error)"
        }
    }
    
}
