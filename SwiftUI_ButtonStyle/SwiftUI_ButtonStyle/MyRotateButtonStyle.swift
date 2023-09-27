//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct MyRotateButtonStyle: ButtonStyle {
    
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .rotationEffect(configuration.isPressed ? .degrees(90) : .degrees(0), anchor: .bottomLeading)
        
    }
}

struct MyRotateButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button Clicked")
        }, label: {
            Text("탭")
        })
        .buttonStyle(MyRotateButtonStyle(color: .blue))
    }
}

