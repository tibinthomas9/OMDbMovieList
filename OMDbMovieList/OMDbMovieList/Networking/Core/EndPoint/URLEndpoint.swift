//
//  URLEndpoint.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

protocol URLEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    func url() -> URL?
}

extension URLEndpoint {
    var scheme: String { return "https" }
    var host: String { return "www.omdbapi.com" }
    var queryItems: [URLQueryItem]? { return nil }

    func url() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "\(path)"
        var items = queryItems
        items?.append(URLQueryItem(name: "apikey", value: Secrets.apiKey))
        components.queryItems = items
        return components.url
    }
}

