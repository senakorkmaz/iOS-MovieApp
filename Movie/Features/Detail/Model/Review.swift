//
//  Review.swift
//  Movie
//
//  Created by Senanur Korkmaz on 9.09.2023.
//

import Foundation


struct ReviewResponse: Codable {
    let id, page: Int
    let results: [Review]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Review: Codable, Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}


struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}

extension Review{
    var authorName: String{
        authorDetails?.username ?? author
    }
    
    var authorImage: String{
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/"){
            image = String(image.dropFirst())
        }
        return image
    }
}


extension AuthorDetails{
    var authorName: String{
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
