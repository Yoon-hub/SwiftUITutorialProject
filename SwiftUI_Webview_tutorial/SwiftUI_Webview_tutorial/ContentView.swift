//
//  ContentView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 최윤제 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView {
            HStack {
                NavigationLink(destination:  MyWebView(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("네이버")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination:  MyWebView(urlToLoad: "https://www.daum.net")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("다음")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination:  MyWebView(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("구글")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
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
