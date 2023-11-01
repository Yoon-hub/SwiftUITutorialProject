//
//  APIClient.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation
import Alamofire

final class APIClient {
    
    static let shared = APIClient()
    
    static let BASE_URL = "https://phplaravel-574671-2229990.cloudwaysapps.com/api"
    
    let interseptors = Interceptor(interceptors: [
        BaseInterceptor()
    ])
    
    let monitors = [APILogger()]
    var session: Session
    
    init() {
        print("APIClient - init() - called")
        session = Session(interceptor: interseptors, eventMonitors: monitors)
    }
    
}
