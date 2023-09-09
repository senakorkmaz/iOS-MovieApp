//
//  DetailView.swift
//  Movie
//
//  Created by Senanur Korkmaz on 8.09.2023.
//

import SwiftUI
enum DetailViewSection: String{
    case about, review
    
    var rawValue: String{
        switch self{
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}
struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie){
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    var body: some View {
        VStack(alignment: .leading){
            header
            VStack{
                HStack{
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate)
                    Text(" | ")
                    Image.VoteImage
                    Text("\(vm.movie.voteCount)")
                    Text(" | ")
                    Image.StarImage
                    Text("\(vm.movie.voteAverage.formatted())")
                  
                }
                .foregroundColor(.AppGrayColor2)
                .frame(maxWidth: .infinity)
                
                HStack{
                    ForEach(vm.sections, id: \.self){ section in
                        
                        DetailSectionCard(section: section, namespace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    vm.selectedSection = section
                                }
                            }
                    }
                    Spacer()
                }
               
                switch vm.selectedSection{
                    case .about:
                    Text(vm.movie.overview)
                    case .review:
                    ScrollView{
                        VStack{
                            ForEach(vm.reviews){ review in
                                ReviewCard(review: review)
                                
                            }
                        }
                    }
                    
                }
                Spacer()
            }
            .padding()
            .padding(.top,contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBackgroundColor)
        .task {
            await vm.fetchReview()
        }
    }
    var backdropImageHeight: CGFloat{
        screenHeight * 0.35
    }
    
    var posterImageHeight : CGFloat{
        screenHeight * 0.20
    }
    
    var posterImageWidth : CGFloat{
        screenWidth * 0.30
    }
    
    var backdropImageOffset: CGFloat{
        screenHeight * 0.15
    }
    var titleOffset: CGFloat{
        screenHeight * 0.12
    }
    var contentOffset: CGFloat{
        screenHeight * 0.12
    }
    
   
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: dev.movie)
    }
}

private extension DetailView{
    var header: some View{
        ZStack(alignment: .leading){
            ZStack(alignment: .top){
                CustomImageView(itemWidth: screenWidth, itemHeight: backdropImageHeight, movie: vm.movie,imageType: .backdrop)
                HStack{
                    Image.BackIcon
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text("Detail")
                    Spacer()
                    Image.BookmarkIcon
                    
                }
                .padding()
                .background(Color.AppBackgroundColor)
            }
            
            HStack{
                CustomImageView(itemWidth: posterImageWidth, itemHeight: posterImageHeight, movie: vm.movie)
                    .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0.20),radius: 20)
                
                Text(vm.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top,titleOffset)
            }
            .padding()
            .offset(y: posterImageHeight)
        }
    }
}
