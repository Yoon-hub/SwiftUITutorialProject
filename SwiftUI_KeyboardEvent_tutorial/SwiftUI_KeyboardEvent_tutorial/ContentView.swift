//
//  ContentView.swift
//  SwiftUI_KeyboardEvent_tutorial
//
//  Created by 최윤제 on 2023/11/01.
//

import SwiftUI

struct ContentView: View {
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmInput: String = ""
    @State var keyboardStatusInfo: String = ""
    
    @ObservedObject var keybarodMonitor: KeyBoardMonitor = KeyBoardMonitor()
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                
                VStack(alignment: .leading) {
                    Text("키보드 상태")
                        .font(.title2)
                    Divider()
                        .colorMultiply(.clear)
                        .padding(.vertical, 5)
                    Text(keyboardStatusInfo)
                    Text("키보드 높이\(keybarodMonitor.keyboardHeight)")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                .onReceive(self.keybarodMonitor.updatedKeyBooardStatusACtion) { status in
                    self.keyboardStatusInfo = status.description
                }
                
                VStack(alignment: .leading) {
                    Text("이름")
                    TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                
                VStack(alignment: .leading) {
                    Text("이메일")
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                
                VStack(alignment: .leading) {
                    Text("비번")
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                    SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 300)
                
                GeometryReader { proxy in
                    
                    Button {
                        print("회원가입 버튼 클릭")
                    } label: {
                        Text("회원가입하기")
                            .foregroundColor(.black)
                            .font(.title2)
                            .frame(maxWidth: proxy.frame(in: .named("containerVstack")).width)
                            .frame(height: 50)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
                }
                
                
                
            }// VStack

        }
        .background(Color.purple)
        .padding(.horizontal, 20)
        .coordinateSpace(name: "containerVstack")
        .navigationTitle("회원가입")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
