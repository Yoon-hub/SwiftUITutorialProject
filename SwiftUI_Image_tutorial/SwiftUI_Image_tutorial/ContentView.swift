//
//  ContentView.swift
//  SwiftUI_Image_tutorial
//
//  Created by 최윤제 on 2023/09/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("sunset")
                    .frame(height: 10)
                    .offset(y: -100)
                CircleImageView()
                    
                HStack{
                    NavigationLink(destination: MyWebView(urlToLoad: "https:www.naver.com")) {
                        Text("네이버")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebView(urlToLoad: "https:www.naver.com")) {
                        Text("다음")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(20)
                    }
                    
                }.padding(30)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
