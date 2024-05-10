//
//  MovieListView.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//


import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.movies, id: \.imdbID) { movie in
                            MoviesRowView(movie: movie)
                                .padding(.horizontal)
                                .cardBackground()
        
                            
                        }
                        .listRowSeparator(.hidden)
                        
                        switch viewModel.state {
                        case .loading:
                            LoadingView()
                        case .error(let error):
                            ErrorView(errorText: error.localizedDescription)
                        case .empty:
                            NoItemView(text: "No data available")
                        case .loaded:
                            if viewModel.isMoreDataAvailable() {
                                ProgressView()
                                    .progressViewStyle(.linear)
                                    .onAppear {
                                        Task {
                                            try await Task.sleep(nanoseconds: 1000_000_000)
                                            try await viewModel.loadNextPage()
                                        }
                                    }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        try? await viewModel.refreshMovies()
                    }
                    .searchable(text: $viewModel.searchKey, prompt: "Search")
                    
                    .navigationTitle("OMDb Movies")
                    .task {
                        guard  viewModel.state == .empty else { return }
                        try? await viewModel.getMovies()
                        
                    }
                }
            }
            .onSubmit(of: .search) {
                dismissSearch()
                Task {
                    try? await viewModel.refreshMovies()
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}

