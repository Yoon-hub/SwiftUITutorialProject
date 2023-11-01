//
//  ContentView.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 160))
                    .padding(.top, 70)
                
                Spacer()
                
                NavigationLink {
                    LoginView()
                } label: {
                    HStack {
                        Spacer()
                        Text("로그인 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                
                NavigationLink {
                    RegisterView()
                } label: {
                    HStack {
                        Spacer()
                        Text("회원가입 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                .padding(.bottom, 20)
                
                NavigationLink {
                    ProfileView()
                } label: {
                    HStack {
                        Spacer()
                        Text("내 프로필 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                
                NavigationLink {
                    UserListView()
                } label: {
                    HStack {
                        Spacer()
                        Text("사용자 목록 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                Spacer()

            }
            .padding(.horizontal, 20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
