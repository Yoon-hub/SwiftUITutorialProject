//
//  ContentView.swift
//  SwiftUI_Picker_Tutorial
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    
    var dic: [Int: Color] = [ 0: .red, 1: .green, 2: .blue]
    
    @State private var selectionValue = 0
    
    var body: some View {
        VStack {
            
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(dic[selectionValue])
            
            Picker("피커", selection: $selectionValue) {
                Text("빨강").tag(0)
                Text("초록").tag(1)
                Text("파랑").tag(2)
            }
            .pickerStyle(.inline)
            .overlay  {
                RoundedRectangle(cornerRadius: 10)
                    .stroke( dic[selectionValue]!, lineWidth: 2)
            }
            
            Picker("피커", selection: $selectionValue) {
                Text("빨강").tag(0)
                Text("초록").tag(1)
                Text("파랑").tag(2)
            }
            .pickerStyle(.segmented)
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
