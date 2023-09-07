//
//  MovieCardType.swift
//  Movie
//
//  Created by Senanur Korkmaz on 6.09.2023.
//

import Foundation

enum MovieCardType{
    case poster, grid
}

extension MovieCardType{
    var widthPercent: Double{
        switch self{
        case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double{
        switch self{
        case .poster:
            return 0.35
        case .grid:
            return 0.15
        }
    }
    
}
