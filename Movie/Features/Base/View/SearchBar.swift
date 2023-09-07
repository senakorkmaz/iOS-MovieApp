//
//  SearchBar.swift
//  Movie
//
//  Created by Senanur Korkmaz on 6.09.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchTxt: String
    var body: some View {
        TextField("Search", text: $searchTxt)
            .overlay(
                ZStack{
                    Image.CancelIcon
                        .foregroundColor(.white)
                        .opacity(searchTxt.isEmpty ? 0.0 : 1.1)
                        .onTapGesture {
                            searchTxt = ""
                            UIApplication.shared.endEditing()
                        }
                    
                    Image.SearchIcon
                        .opacity(searchTxt.isEmpty ? 1.0 : 0.0)
                }
                , alignment: .trailing)
            .foregroundColor(.AppGrayColor2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.AppGrayColor1)
            )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchTxt: .constant(""))
    }
}
