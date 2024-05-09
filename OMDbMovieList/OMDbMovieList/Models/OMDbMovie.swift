//
//  OMDbMovie.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

struct OMDbMovie: Codable {
    
    let imdbID: String
    let poster: String
    let title: String
    let year: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case poster = "Poster"
        case title = "Title"
        case year = "Year"
        case type = "Type"
    }
}
