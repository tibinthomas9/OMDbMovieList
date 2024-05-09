//
//  AppEndPoint.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

enum AppEndPoint: URLEndpoint {
    case movieSearch(key: String, page: Int = 1)
}
extension AppEndPoint {

    var path: String {
        switch self {
        case .movieSearch(key: _):
            return ""
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .movieSearch(key: let key, page: let page):
            return [URLQueryItem(name: "s", value: key),URLQueryItem(name: "page", value: "\(page)")]
        }
    }
}

