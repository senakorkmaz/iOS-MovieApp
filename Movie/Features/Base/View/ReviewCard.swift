//
//  ReviewCard.swift
//  Movie
//
//  Created by Senanur Korkmaz on 9.09.2023.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(url: URL(string: review.authorImage)){ imaga in
                    imaga.resizable()
                } placeholder: {
                    ZStack{
                        Color.AppGrayColor1
                        if let firstChar = review.authorName.first{
                            Text(String(firstChar))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45,height: 45)
                .clipShape(Circle())
                
                
                Text(review.authorName)
                    .poppins(.medium,16)
            }
            
            Text(review.content)
                .poppins(.light)
            
            Divider()
            
        }
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: dev.review)
    }
}
