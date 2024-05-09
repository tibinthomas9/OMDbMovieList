//
//  MovieListViewModel.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation
@MainActor
class MovieListViewModel: ObservableObject  {
    
    //MARK: State Variables
    @Published private(set) var state = LoadingState.loading
    @Published var movies: [OMDbMovie] = []
    @Published var searchKey: String = "Batman"
    @Published private var error: Error?
    
    //MARK: Pagination logic
    private(set) var page: Int = 1
    private(set) var totalResults: Int = 0

    //MARK: Dependencies
    private let client: any OMDbMovieSearchService
    
    //MARK: Data Retrieval
    func getMovies() async throws {
        do {
            if let moviesResponse = try await client.searchMovies(forKey: searchKey, page: page) {
                processMovies(response: moviesResponse)
            }
            self.state = movies.isEmpty ? .empty :.loaded
        } catch {
            self.movies = []
            self.state = .error(error)
        }
    }
    
    // Fetch new data
    func refreshMovies() async throws {
        guard state != .loading else { return }
        movies = []
        page = 1
        totalResults = 0
        try await getMovies()
    }
    
    //MARK: Data Processsing
    private func processMovies(response: OMDbMovieSearchResponse) {
        self.movies += response.search
        self.totalResults = Int(response.totalResults) ?? 0
    }
    
    //MARK: Pagination methods
    func isMoreDataAvailable() -> Bool {
        guard state != .loading else { return false }
        return movies.count < totalResults
    }
    
    func loadNextPage() async throws {
        guard state != .loading else { return }
        page += 1
        try await getMovies()
        
    }

    //MARK: Initializer
    init(client: any OMDbMovieSearchService = OMDbMovieSearchHttpService()) {
        self.client = client
    }
    
}
