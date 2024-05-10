//
//  CardBackground.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("backgroundColor"))
            .cornerRadius(20)
            .shadow(color: Color.primary.opacity(0.2), radius: 4)
    }
}

extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}
