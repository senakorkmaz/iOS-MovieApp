//
//  ApiConstructor.swift
//  Movie
//
//  Created by Senanur Korkmaz on 6.09.2023.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor{
    let endpoint: Endpoint
    var params: Parameters = [:]
}
