//
//  ContentView.swift
//  SwiftUI_StackView_Tutorial
//
//  Created by 최윤제 on 2023/09/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            Text("신호등")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            Divider()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            
            Spacer()
            Spacer()
        }
        .frame(width: 300)
        .background(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
