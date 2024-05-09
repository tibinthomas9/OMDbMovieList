//
//  APIError.swift
//  OMDbMovieList
//
//  Created by Tibin Thomas on 2024-05-09.
//

import Foundation

enum APIError: Error {
    case malformed
    case networkError(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .malformed:
            return NSLocalizedString("Some of the data is missing"
                                     , comment: "")
        case .networkError(let statusCode):
            return NSLocalizedString("Network faced some error with status code \(statusCode)"
                                     , comment: "")
        case .unknown:
            return NSLocalizedString("Sorry, network encountered some unexpected issues",
                                     comment: "")
        }
    }
}

