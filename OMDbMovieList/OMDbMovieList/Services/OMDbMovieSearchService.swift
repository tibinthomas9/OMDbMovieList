//
//  OMDbMovieSearchService.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

protocol OMDbMovieSearchService {
    func getMovieList(forSearchKey: String) async throws -> OMDbMovieSearchResponse?
}
