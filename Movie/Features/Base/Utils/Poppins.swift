//
//  Poppins.swift
//  Movie
//
//  Created by Senanur Korkmaz on 5.09.2023.
//

import Foundation

enum Poppins: String{
    case black, bold, light, medium, regular, semiBold
    
    var fontName: String{
        "Poppins-\(self.rawValue.capitalizeFirstLetter)"
    }
    
}
