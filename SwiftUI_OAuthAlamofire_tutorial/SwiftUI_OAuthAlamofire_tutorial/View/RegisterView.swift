//
//  RegisterView.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/24.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    TextField("이름", text: $emailInput)
                } header: {
                    Text("이름")
                }
                
                
                Section {
                    TextField("이메일", text: $emailInput)
                } header: {
                    Text("이메일")
                }
                
                Section {
                    TextField("비밀번호", text: $passwordInput)
                    TextField("비밀번호 확인", text: $passwordInput)
                } header: {
                    Text("비밀번호")
                }
                
                Section {
                    Button {
                        print("로그이 버튼 클릭")
                        userVM.register(name: nameInput, email: emailInput, password: passwordInput)
                    } label: {
                        Text("회원가입 하기")
                    }
                 }
  
            }
        }
        .navigationTitle("회원가입 하기")
        .navigationBarTitleDisplayMode(.large)
    
    }
    
}
