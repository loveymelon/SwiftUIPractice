//
//  NetworkManager.swift
//  SwiftUIPractice
//
//  Created by 김진수 on 12/3/24.
//

import Foundation
import Alamofire

final class NetworkManager: Sendable {
    private let shared = NetworkManager()
    private let baseURL = "https://picsum.photos/200/300"
    
    private init() { }
    
    func requestNetwork() async -> Data? {
        do {
            let response = await AF.request(baseURL, method: .get)
                .cacheResponse(using: .cache)
                .validate(statusCode: 200..<300)
                .serializingResponse(using: .data)
                .response
            
            switch response.result {
            case .success(let data):
                return data
            case .failure(let error):
                print(error)
                return nil
            }
        }
    }    
}
