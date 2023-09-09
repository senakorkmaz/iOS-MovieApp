//
//  HomeView.swift
//  Movie
//
//  Created by Senanur Korkmaz on 5.09.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTxt = ""
    @StateObject private var vm = HomeViewModel()
    @Namespace var namespace
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack(alignment: .leading, spacing: 20){
                Text("What do you want to watch?")
                    .poppins(.bold,20)
                SearchBar(searchTxt: $searchTxt)
                Text("Trending Movies")
                    .poppins(.bold,18)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(vm.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(vm.genre) { genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedGenre = genre
                                        Task{
                                            await vm.fetchMovieForSelectedGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())], spacing: 20){
                       
                        ForEach(vm.moviedForSelectedGerne){ movie in
                            MovieCard(movie: movie,type: .grid)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
            }
            
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBackgroundColor)
        .fullScreenCover(item: $vm.selectedMovie) { movie in
            DetailView(movie: movie)
        }
        .task{
            await vm.fetchTrendingMovie()
            await vm.fetchGenre()
            await vm.fetchMovieForSelectedGenre()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
