//
//  OMDbMovieSearchHttpService.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

class OMDbMovieSearchHttpService: OMDbMovieSearchService {
    
    func searchMovies(forKey: String, page: Int) async throws -> OMDbMovieSearchResponse? {
        guard let url =  AppEndPoint.movieSearch(key: forKey, page: page).url() else { return nil }
        do {
            if let moviesResponse = try await NetworkClient.shared.fetchHttpData(from: url,
                                                                                 responseType: OMDbMovieSearchResponse.self) {
                return moviesResponse
            } else { return nil }
        } catch { throw error }
        
    }
    
}
