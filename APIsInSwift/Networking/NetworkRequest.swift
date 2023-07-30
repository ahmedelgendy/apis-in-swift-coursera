//
//  Endpoint.swift
//  NetworkPoC
//
//  Created by Ahmed Elgendy on 14.07.2023.
//

import Foundation

// MARK: - Endpoint Structure
protocol NetworkRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var bodyParameters: [String: Any] { get }
    var encodingType: EncodingType { get }
    var authType: AuthType { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum EncodingType {
    case json
    case queryString
}

enum AuthType {
    case token
    case none
}
