//
//  UserData.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/24.
//

import Foundation

struct UserData: Codable, Identifiable {
    
    var uudi: UUID = UUID()
    var id: Int
    var name: String
    var email: String
    var avatar: String
    
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case email
//        case avator
//    }
}
