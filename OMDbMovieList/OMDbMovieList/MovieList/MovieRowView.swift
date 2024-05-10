//
//  MovieRowView.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import SwiftUI

struct MoviesRowView: View {

    var movie: OMDbMovie
    

    var body: some View {
        HStack {
            image
            details
        }.padding(.vertical)
    }

    var image: some View {
        
        let asyncImage = AsyncImage(
            url: URL(string: movie.poster),
            scale: 1,
            content:
                { image in
                    image
                        .resizable()
                        .scaledToFit()
                },
            placeholder: { ProgressView() })
            .frame(width: 80, height: 80)
        return RoundedRectangleBorderView(view: asyncImage)

    }

    var details: some View {
        VStack(alignment: .leading, spacing: 15) {
            name
            year
        }
    }

    var name: some View {
        Text(movie.title)
            .font(.headline)
            .foregroundColor(.primary)
            .bold()
    }

    var year: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(movie.year)
                .font(.body)
                .foregroundColor(.secondary)
            Spacer()
            Button("View") {
                
            }.buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MoviesRowView(movie: OMDbMovie(imdbID: "12", poster: "", title: "JOhn wick", year: "2022", type: "Movie"))
}
