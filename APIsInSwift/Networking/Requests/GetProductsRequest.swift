//
//  GetProductEndpoint.swift
//  Networking
//
//  Created by Ahmed Elgendy on 29.07.2023.
//

import Foundation

struct GetProductsRequest {
    let limit: Int
}

extension GetProductsRequest: NetworkRequest {
    var baseURL: String { "https://fakestoreapi.com" }
    var path: String { "/products" }
    var method: HTTPMethod { .get }
    var headers: [String : String] {
        [:]
    }
    var bodyParameters: [String : Any] {
        ["limit": limit]
    }
    var encodingType: EncodingType {
        return .queryString
    }
    
    var authType: AuthType { .none }
}
