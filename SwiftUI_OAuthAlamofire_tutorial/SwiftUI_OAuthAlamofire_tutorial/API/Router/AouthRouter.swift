//
//  AouthRouter.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation
import Alamofire

// 인증 라우터
// 로그인, 회원가입, 토큰 갱신
enum AuthRouter: URLRequestConvertible {
    case regist(name: String, email: String, passwd: String)
    case login(email: String, passwd: String)
    case tokenRefresh
    
    var baseURL: URL {
        return URL(string: APIClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .regist:
            return "user/register"
        case .login:
            return "user/login"
        case .tokenRefresh:
            return "user/token-refresh"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .regist, .login, .tokenRefresh:
            return .post
        default:
            return .get
        }
    }
    
    var paramaters: Parameters {
        switch self {
        case let .login(email, passwd):
            var params = Parameters()
            params["email"] = email
            params["password"] = passwd
            return params
        case let .regist(name, email, passwd):
            var params = Parameters()
            params["name"] = name
            params["email"] = email
            params["password"] = passwd
            return params
        case .tokenRefresh:
            var params = Parameters()
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: paramaters).httpBody
        
        return request
    }
    
}
