//
//  ContentView.swift
//  SwiftUI_Modifier_tutorial
//
//  Created by 최윤제 on 2023/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 30) {
            Text("Hello, World")
                .modifier(MyRoundedText())
            Text("Hello, World")
                .myRoundedTextStyle()
            Image(systemName: "person")
                .myRoundedTextStyle()
        }
        
        
    }
}

struct MyRoundedText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 10)
                    .foregroundColor(.blue)
            )
    }
    
}

extension View {
    func myRoundedTextStyle() -> some View {
        self.modifier(MyRoundedText())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
