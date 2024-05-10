//
//  RoundedRectangle.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import SwiftUI

struct RoundedRectangleBorderView<Content: View>: View {
    var view: Content
    var body: some View {
        view
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary.opacity(0.5),
                        lineWidth: 1))
    }
}

#Preview {
    RoundedRectangleBorderView(view: EmptyView())
}
