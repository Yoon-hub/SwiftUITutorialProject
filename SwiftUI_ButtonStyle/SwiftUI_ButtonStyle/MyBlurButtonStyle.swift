//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct MyBlurButtonStyle: ButtonStyle {
    
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .blur(radius: configuration.isPressed ? 10 : 0)

        
    }
}

struct MyBlurButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button Clicked")
        }, label: {
            Text("탭")
        })
        .buttonStyle(MyBlurButtonStyle(color: .blue))
    }
}

