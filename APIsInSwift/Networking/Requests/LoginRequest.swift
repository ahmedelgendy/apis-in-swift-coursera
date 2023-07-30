//
//  LoginRequest.swift
//  Networking
//
//  Created by Ahmed Elgendy on 30.07.2023.
//

import Foundation

struct LoginRequest {
    let username: String
    let password: String
}

extension LoginRequest: NetworkRequest {
    var baseURL: String { "https://fakestoreapi.com" }
    var path: String { "/auth/login" }
    var method: HTTPMethod { .post }
    var headers: [String : String] { [:] }
    var bodyParameters: [String : Any] {
        [
            "username": username,
            "password": password
        ]
    }
    var encodingType: EncodingType { .json }
    var authType: AuthType { .none }
}
