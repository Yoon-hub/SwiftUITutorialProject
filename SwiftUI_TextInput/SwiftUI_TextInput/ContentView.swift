//
//  ContentView.swift
//  SwiftUI_TextInput
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("사용자 이름", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                Button {
                    self.inputValue = ""
                } label: {
                    if self.inputValue.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)
                    }
                }
            }
            HStack {
                SecureField("비밀번호를 입력해주세요!", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    self.inputValue = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.secondary)
                }
            }
            
            Text("입력한 비밀번호: \(password)")
        }
        .padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
