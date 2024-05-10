//
//  NoItemView.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import SwiftUI

struct NoItemView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20,
                             style: .continuous )
            .fill(Color(.lightGray).opacity(0.2))
            Text(text)
                .foregroundColor(.white)
                .font(.title2)
        }
        .frame(height: 300)
    }
}

#Preview {
    NoItemView(text: "No data")
}
