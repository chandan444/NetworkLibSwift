//
//  NetworkRequest.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation


enum HTTPMethod: String {
    case Get = "GET"
    case POST = "POST"
}

enum NetworkError: Error {
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
}

protocol NetworkRequest {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension NetworkRequest {
    var baseURL: String { "https://example.com" }
    var header: [String: String]? { nil }
    var body: [String: String]? { nil }
}
