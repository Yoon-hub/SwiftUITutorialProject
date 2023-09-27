//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

enum ButtonType {
    case tab
    case long
}

struct MyButtonStyle: ButtonStyle {
    
    var color: Color
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .onTapGesture {
                if self.type == .tab {
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred() //
                }
            }
            .onLongPressGesture {
                if self.type == .long {
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred() //
                }

            }
        
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button Clicked")
        }, label: {
            Text("탭")
        })
        .buttonStyle(MyButtonStyle(color: .blue, type: .tab))
    }
}

