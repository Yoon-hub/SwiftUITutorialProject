//
//  APIService.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import Foundation

import Alamofire


final class APIService {
    
    private init() {}
    
    static let shared = APIService()
    
    func apiIntegration<T: Decodable>(type: T.Type = T.self, api: RandomUserAPi, method: HTTPMethod, completion: @escaping (Result<T, Error>, Int) -> Void) {
        AF.request(api.url, method: method, parameters: api.parameters, encoding: URLEncoding(arrayEncoding: .noBrackets) , headers: api.headers).responseDecodable(of: T.self) { response in

            guard let statusCode = response.response?.statusCode else { return }
            switch response.result{
            case .success(let data):
                completion(.success(data), statusCode)
            case .failure(let error):
                completion(.failure(error), statusCode)

            }
        }
    }
    
}
