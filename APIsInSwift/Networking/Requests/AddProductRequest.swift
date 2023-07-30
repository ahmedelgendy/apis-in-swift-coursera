//
//  AddProductRequest.swift
//  Networking
//
//  Created by Ahmed Elgendy on 29.07.2023.
//

import Foundation

struct AddProductParams {
    let title: String
    let price: Double
    let description: String
    let category: String
}

struct AddProductRequest: NetworkRequest {
    
    let params: AddProductParams

    var baseURL: String { "https://fakestoreapi.com" }
    var path: String { "/products" }
    var method: HTTPMethod { .post }
    var headers: [String : String] {
        [:]
    }
    var bodyParameters: [String : Any] {
        [
            "title": params.title,
            "price": params.price,
            "description": params.description,
            "category": params.category
        ]
    }
    var encodingType: EncodingType {
        return .json
    }
    
    var authType: AuthType { .token }
}
