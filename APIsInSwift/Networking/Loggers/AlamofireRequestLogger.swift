//
//  AlamofireRequestLogger.swift
//  Networking
//
//  Created by Ahmed Elgendy on 28.07.2023.
//

import Foundation
import Alamofire

struct AlamofireRequestLogger: EventMonitor {
    var queue: DispatchQueue = DispatchQueue(label: "com.ahmedelgendy.apisinswift.networklogger")

    func requestDidFinish(_ request: Request) {
        print("------- Request Start -------")
        print(request.description)
        print("Headers ", request.request?.allHTTPHeaderFields ?? [:])
        print("Body ", String(data: request.request?.httpBody ?? Data(), encoding: .utf8) ?? "")
        print("------- Request End -------\n")
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("------- Response Start -------")
        if let error = response.error {
            print("Error:", error.errorDescription ?? "")
        } else {
            print(String(data: response.data ?? Data(), encoding: .utf8) ?? "")
        }
        print("-------- Response End --------\n")
    }
    
}
