//
//  AuthenticationRepository.swift
//  Networking
//
//  Created by Ahmed Elgendy on 30.07.2023.
//

import Foundation

class AuthenticationRepository {
    
    private let client: HTTPClient
    private let tokenManager: TokenManager
    
    init(client: HTTPClient, tokenManager: TokenManager) {
        self.client = client
        self.tokenManager = tokenManager
    }
    
    func login(username: String, password: String) async throws {
        let result = await client.execute(LoginRequest(username: username, password: password))
        let (data, response) = try result.get()
        let token = try StoreAPIResponseMapper<LoginResponse>.map(response: response, data: data)
        _ = tokenManager.saveToken(token.token)
    }
}

struct LoginResponse: Decodable {
    let token: String
}
