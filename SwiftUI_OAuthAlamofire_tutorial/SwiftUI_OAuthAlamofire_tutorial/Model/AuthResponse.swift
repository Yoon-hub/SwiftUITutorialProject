//
//  AuthResponse.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation

struct AuthResponse: Codable {
    var user: UserData
    var token: TokenData
    
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
