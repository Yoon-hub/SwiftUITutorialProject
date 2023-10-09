//
//  EndPoint.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import Foundation

import Alamofire

enum RandomUserAPi {
    case requestAll
}


extension RandomUserAPi {
    var url: URL {
        switch self {
        case .requestAll:
            return URL(string: "https://randomuser.me/api/?results=10")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .requestAll:
            return ["Content-Type" : "application/x-www-form-urlencoded"]
        }
    }
        
    var parameters: [String: Any]? {
            switch self {
            case .requestAll:
                return nil
        }
    }
    
}
