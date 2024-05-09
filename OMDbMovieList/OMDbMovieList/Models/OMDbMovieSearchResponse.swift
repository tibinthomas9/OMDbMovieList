//
//  OMDbMovieSearchResponse.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

struct OMDbMovieSearchResponse: Codable {
    
    let search: [OMDbMovie]
    let totalResults: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
    
}
