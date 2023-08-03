//
//  ProductsRepository.swift
//  Networking
//
//  Created by Ahmed Elgendy on 29.07.2023.
//

import Foundation

struct RemoteProduct: Decodable {
    let title: String
    let price: Double
    let description: String
    let category: String
}

class ProductsRepository {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getProducts(limit: Int) async throws -> [RemoteProduct] {
        let request = GetProductsRequest(limit: limit)
        let result = await client.execute(request)
        let (data, response) = try result.get()
        return try StoreAPIResponseMapper.map(response: response, data: data)
    }
    
    func updateProduct(with params: UpdateProductParams) async throws -> UpdateProductResponse {
        let request = UpdateProductRequest(params: params)
        let result = await client.execute(request)
        let (data, response) = try result.get()
        return try StoreAPIResponseMapper.map(response: response, data: data)
    }
}
