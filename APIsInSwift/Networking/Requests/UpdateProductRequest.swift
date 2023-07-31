//
//  UpdateProductRequest.swift
//  Networking
//
//  Created by Ahmed Elgendy on 30.07.2023.
//

import Foundation

struct UpdateProductParams {
    let id: Int
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
}

struct UpdateProductRequest {
    let params: UpdateProductParams
}

extension UpdateProductRequest: NetworkRequest {
    var baseURL: String { NetworkConstants.baseURL }
    var path: String { "/products/\(params.id)" }
    var method: HTTPMethod { .put }
    var headers: [String : String] { [:] }
    var bodyParameters: [String : Any] {
        var parameters = [String: Any]()
        parameters["title"] = params.title
        parameters["price"] = params.price
        parameters["description"] = params.description
        parameters["category"] = params.category
        return parameters
    }
    var encodingType: EncodingType { .json }
    var authType: AuthType { .token }
}

struct UpdateProductResponse: Decodable {
    let id: Int
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
}
