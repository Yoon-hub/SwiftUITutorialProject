//
//  MyTabView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/24.
//

import SwiftUI

struct MyTabView: View {
    
    var body: some View {
        TabView {

            MyView(text: "테스트1", color: .yellow)
                .tabItem {
                    Image(systemName: "airplane")
                }
                .tag(0)
            MyView(text: "테스트2", color: .blue)
                .tabItem {
                    Image(systemName: "flame.fill")
                }
                .tag(1)
            MyView(text: "테스트3", color: .green)
                .tabItem {
                    Image(systemName: "doc.fill")
                }
                .tag(2)
        }
//        .onAppear() {
//            UITabBar.appearance().backgroundColor = .red
//        }
        
        
    
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
