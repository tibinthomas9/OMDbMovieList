//
//  MovieListViewModelTests.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation
import XCTest

@testable import OMDbMovieList

@MainActor
final class MovieListViewModelTests: XCTestCase {
    
    func testGetMoviesSucess() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .singleData))
        
        //when
        try await viewModel.getMovies()
        
        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.movies.count > 0)
        XCTAssert(viewModel.page == 1)
        XCTAssert(viewModel.totalResults > 0)
        
    }
    
    func testGetMoviesError() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .error))
        
        //when
        try await viewModel.getMovies()
        
        // then
        let state = viewModel.state
        if case .error(_) = state {
            XCTAssert(true)
        } else {
            XCTFail("Should had thrown an error")
        }
    }
    
    func testRefreshMovies() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .singleData))
        try await viewModel.getMovies()
        
        //when
        try await viewModel.refreshMovies()
        
        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.movies.count > 0)
        XCTAssert(viewModel.page == 1)
        XCTAssert(viewModel.totalResults > 0)
        
    }
    
    func testIsMoreDataAvailableFalse() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .singleData))
        try await viewModel.getMovies()
        
        //when
        let hasMoreData =  viewModel.isMoreDataAvailable()
        
        // then
        XCTAssert(hasMoreData == false)
        
    }
    
    func testIsMoreDataAvailableTrue() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .multiPageData))
        try await viewModel.getMovies()
        
        //when
        let hasMoreData =  viewModel.isMoreDataAvailable()
        
        // then
        XCTAssert(hasMoreData == true)
        
    }
    
    
    func testLoadNextPageHasNoMoreData() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .singleData))
        try await viewModel.getMovies()
        
        //when
        try await viewModel.loadNextPage()
        
        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.movies.count > 0)
        XCTAssert(viewModel.page == 1)
        XCTAssert(viewModel.totalResults > 0)
        
    }
    
    func testLoadNextPageHasMoreData() async throws {
        
        // given
        let viewModel = MovieListViewModel(client: OMDbMovieSearchMockService(mockType: .multiPageData))
        try await viewModel.getMovies()
        
        //when
        try await viewModel.loadNextPage()
        
        // then
        XCTAssertEqual(viewModel.state, .loaded)
        XCTAssert(viewModel.movies.count > 1)
        XCTAssert(viewModel.page == 2)
        XCTAssert(viewModel.totalResults > 0)
        
    }
    
}


