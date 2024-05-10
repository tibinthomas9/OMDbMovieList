//
//  LoadingView.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}


#Preview {
    LoadingView()
}
