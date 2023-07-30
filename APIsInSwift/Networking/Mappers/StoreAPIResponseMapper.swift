//
//  StoreAPIResponseMapper.swift
//  Networking
//
//  Created by Ahmed Elgendy on 30.07.2023.
//

import Foundation

struct StoreAPIResponseMapper<T: Decodable> {
    
    private init() { }
    
    static func map(response: HTTPURLResponse, data: Data) throws -> T {
        if response.statusCode == 401 {
            throw UnauthorizedError()
        }
        guard response.statusCode == 200 && !data.isEmpty else {
            throw InvalidDataError()
        }
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw ParsingFailedError()
        }
        return result
    }
    
    struct InvalidDataError: Error { }
    struct ParsingFailedError: Error { }
    struct UnauthorizedError: Error { }
}

