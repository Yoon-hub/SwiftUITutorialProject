//
//  ContentView.swift
//  SwiftUI_Indicator
//
//  Created by 최윤제 on 2023/11/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Button {
                    Task {
                        isLoading = true
                        try await Task.sleep(nanoseconds: 3_000_000_000)
                        isLoading = false
                    }
                } label: {
                    Text("클릭")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 240, height: 80, alignment: .center)
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1.5) // strokeBorder는 안쪽으로 선이 채워진다.
                )

            
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.black
                    .edgesIgnoringSafeArea(.all)
                )
            
            

            if isLoading {
                ActivityIndicator()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
