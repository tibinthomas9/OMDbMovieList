//
//  OMDbMovieSearchHttpServiceTests.swift
//  OMDbMovieListTests
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation
import XCTest

@testable import OMDbMovieList

@MainActor
final class OMDbMovieSearchHttpServiceTests: XCTestCase {
    
    func testSearchMoviesSucess() async throws {
        
        // given
        let service = OMDbMovieSearchHttpService()
        
        //when
        let response = try await service.searchMovies(forKey: "Batman", page: 1)
        
        // then
        XCTAssert(response?.search.count ?? 0 > 0)
        XCTAssert(Int(response?.totalResults ?? "") ?? 0 > 0)
        
    }
    
    func testSearchMoviesFailure() async throws {
        
        // given
        let service = OMDbMovieSearchHttpService()
        
        //when
        do {
            let response = try await service.searchMovies(forKey: "", page: 1)
        } catch {
            // then
            XCTAssert(true)
        }
       
        
        
    }
}

