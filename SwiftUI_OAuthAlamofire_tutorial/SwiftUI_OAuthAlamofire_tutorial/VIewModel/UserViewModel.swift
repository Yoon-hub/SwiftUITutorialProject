//
//  UserViewModel.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Alamofire
import Combine
import Foundation

class UserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var loggedInUser: UserData? = nil
    
    
    /// 회원가입 하기
    func register(name: String, email: String, password: String) {
        print("Request Service")
        
        AuthAPIService.register(name: name, email: email, password: password).sink { completion in
            print(completion)
        } receiveValue: { userData in
            self.loggedInUser = userData
        }.store(in: &subscription)

    }
    
}
