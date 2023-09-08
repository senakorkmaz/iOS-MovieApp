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
                    Text(vm.movie.releaseDate ?? "2023")
                    Text(" | ")
                    Image.ClockIcon
                    Text("148 Minutes")
                    Text(" | ")
                    Image.GenreIcon
                    Text("Action")
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
                }
               
                Spacer()
            }
            .padding()
            .padding(.top,contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBackgroundColor)
    }
    var posterImageHeight: CGFloat{
        screenHeight * 0.35
    }
    
    var backdropImageSize: CGFloat{
        screenHeight * 0.20
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
                CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
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
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: vm.movie,imageType: .backdrop)
                Text(vm.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top,titleOffset)
            }
            .padding()
            .offset(y: backdropImageSize)
        }
    }
}
