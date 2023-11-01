//
//  LoginView.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("이메일", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("비밀번호", text: $passwordInput)
                        .keyboardType(.default)
                } header: {
                    Text("로그인 정보")
                }
                
                Section {
                    Button {
                        print("로그이 버튼 클릭")
                    } label: {
                        Text("로그인 하기")
                    }

                }
  
            }
        }
        .navigationTitle("로그인 하기")
        .navigationBarTitleDisplayMode(.large)
    
    }
    
}
