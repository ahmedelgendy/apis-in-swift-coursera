//
//  HTTPClient.swift
//  Networking
//
//  Created by Ahmed Elgendy on 26.07.2023.
//

import Foundation

protocol HTTPClient {
    func execute(_ request: NetworkRequest) async -> Result<(Data, HTTPURLResponse), Error>
}

