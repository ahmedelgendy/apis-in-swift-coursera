//
//  AFRequest.swift
//  Networking
//
//  Created by Ahmed Elgendy on 30.07.2023.
//

import Foundation
import Alamofire

struct AlamofireRequest: URLRequestConvertible {
    private let request: NetworkRequest
    private let tokenManager: TokenManager
    
    init(from request: NetworkRequest, tokenManager: TokenManager) {
        self.request = request
        self.tokenManager = tokenManager
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: request.baseURL + request.path) else {
            throw InvalidRequestURL()
        }
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = request.method.rawValue
        // Headers
        for header in request.headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        // Auth
        switch request.authType {
        case .token:
            if let token = tokenManager.retrieveToken() {
                urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        case .none: break
        }
        // Body & Query Items
        switch request.encodingType {
        case .queryString:
            return try URLEncoding.default.encode(urlRequest,with: request.bodyParameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: request.bodyParameters)
        }
    }
    
    private struct InvalidRequestURL: Error {}
    
}
