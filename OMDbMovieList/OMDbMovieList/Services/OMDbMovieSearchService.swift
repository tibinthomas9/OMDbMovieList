//
//  OMDbMovieSearchService.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

protocol OMDbMovieSearchService {
    func searchMovies(forKey: String, page: Int) async throws -> OMDbMovieSearchResponse?
}
