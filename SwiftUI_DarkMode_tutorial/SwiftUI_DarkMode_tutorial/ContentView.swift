//
//  ContentView.swift
//  SwiftUI_DarkMode_tutorial
//
//  Created by 최윤제 on 2023/10/10.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
            //Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
            VStack {
                Spacer()
                Button {
                    shouldShowAlert.toggle()
                } label: {
                    Text("로그인하러가기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Theme.myButtonColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.white, lineWidth: 3)
                        )
                }
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("안녕하세요?!"), message: Text("오늘도 빡고팅!?"), dismissButton: .default(Text("닫기")))
                }
                Spacer().frame(height: 100)
            }
            

        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.white
        let darkColor = Color.black
        
        switch scheme {
        case .dark:
            return darkColor
        case .light:
            return lightColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.pink
        let darkColor = Color.purple
        
        switch scheme {
        case .dark:
            return darkColor
        case .light:
            return lightColor
        @unknown default:
            return lightColor
        }
    }
}
