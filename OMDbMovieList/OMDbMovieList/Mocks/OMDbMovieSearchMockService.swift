//
//  OMDbMovieSearchMockService.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

class OMDbMovieSearchMockService: OMDbMovieSearchService {
    
    enum MockType {
        case error
        case singleData
        case multiPageData
    }
    
    let mockType: MockType
    
    init(mockType: MockType) {
        self.mockType = mockType
    }
    
    
    func searchMovies(forKey: String, page: Int) async throws -> OMDbMovieSearchResponse? {
   
        try await Task.sleep(nanoseconds: 1_000_000_000)
        switch mockType {
        case .error:
            throw APIError.unknown
        case .singleData:
            return OMDbMovieSearchResponse.MockResponse
        case .multiPageData:
            return OMDbMovieSearchResponse.MultiPageMockResponse
        }
        
        
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
    
    static var MultiPageMockResponse: OMDbMovieSearchResponse {
        return OMDbMovieSearchResponse(search: [OMDbMovie(imdbID: "123",
                                                          poster: "",
                                                          title: "Batman",
                                                          year: "2014",
                                                          type: "Movie")],
                                       totalResults: "3",
                                       response: "true")
    }
}
