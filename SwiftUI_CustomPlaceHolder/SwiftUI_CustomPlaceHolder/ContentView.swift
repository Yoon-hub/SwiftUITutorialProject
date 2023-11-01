//
//  ContentView.swift
//  SwiftUI_CustomPlaceHolder
//
//  Created by 최윤제 on 2023/11/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    var body: some View {
        VStack {
            TextField("", text: $text)
                .placeholder(shouldShow: text.isEmpty) {
                    Text("이메일")
                        .foregroundColor(.gray)
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
