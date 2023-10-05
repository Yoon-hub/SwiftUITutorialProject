//
//  ContentView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import SwiftUI

struct ContentView: View {
    
    let myData = Array(1...2000).map { return "\($0)번" }
    
    var body: some View {
        
        ScrollView {
            //Column은 호리젠탈 아이템 레이아웃을 설정하는 부분
            // .fixed 고정
            // .adapative 여러개 채우기 - 채울수 있을 만큼 채우기
            // . flexible은 하나만 채우기 - 하나를 끝까지 채우기
            LazyVGrid(columns: [
                GridItem(.fixed(100)),
                //GridItem(.adaptive(minimum: 50)),
                GridItem(.flexible(minimum: 50))
            
            ], alignment: .center, spacing: 10) {
                
                ForEach(myData, id: \.self) {
                    Rectangle()
                        .frame(height: 60)
                        .foregroundColor(.blue)
                        .overlay(
                            Text($0)
                        )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
