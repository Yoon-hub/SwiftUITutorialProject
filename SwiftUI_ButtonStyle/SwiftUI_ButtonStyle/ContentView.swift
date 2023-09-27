//
//  ContentView.swift
//  SwiftUI_ButtonStyle
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Button Clicked")
            }, label: {
                Text("탭")
            })
            .buttonStyle(MyButtonStyle(color: .blue, type: .tab))
            
            Button(action: {
                print("Button Clicked")
            }, label: {
                Text("롱클릭")
            })
            .buttonStyle(MyButtonStyle(color: .green, type: .long))
            
            Button(action: {
                print("Button Clicked")
            }, label: {
                Text("회전버튼")
            })
            .buttonStyle(MyRotateButtonStyle(color: .pink))
            
            Button(action: {
                print("Button Clicked")
            }, label: {
                Text("축소버튼")
            })
            .buttonStyle(MySmallerButtonStyle(color: .purple))
            
            Button(action: {
                print("Button Clicked")
            }, label: {
                Text("블러버튼")
            })
            .buttonStyle(MyBlurButtonStyle(color: .black))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
