//
//  AuthAPIService.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation
import Alamofire
import Combine

enum AuthAPIService {
    static func register(name: String, email: String, password: String) -> AnyPublisher<UserData, AFError> {
        print("AuthAPIService - register() called")
        
        return APIClient.shared.session
            .request(AuthRouter.regist(name: name, email: email, passwd: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map {$0.user}
            .eraseToAnyPublisher()
    }
    
}
