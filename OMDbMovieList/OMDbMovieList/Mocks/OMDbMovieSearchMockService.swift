//
//  OMDbMovieSearchMockService.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

class OMDbMovieSearchMockService: OMDbMovieSearchService {
    func getMovieList(forSearchKey: String) async throws -> OMDbMovieSearchResponse? {
        try await Task.sleep(for: .seconds(1))
        return OMDbMovieSearchResponse.MockResponse
    }
    
}


extension OMDbMovieSearchResponse {
    static var MockResponse: OMDbMovieSearchResponse {
        return OMDbMovieSearchResponse(search: [OMDbMovie(imdbID: "123", 
                                                          poster: "",
                                                          title: "Batman",
                                                          year: "2014",
                                                          type: "Movie")],
                                       totalResults: "1",
                                       response: "true")
    }
}
