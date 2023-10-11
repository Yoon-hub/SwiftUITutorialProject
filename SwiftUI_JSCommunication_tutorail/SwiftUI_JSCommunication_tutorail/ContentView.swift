//
//  ContentView.swift
//  SwiftUI_JSCommunication_tutorail
//
//  Created by 최윤제 on 2023/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    MyWebView(urlToLoad: "https://www.naver.com")
                    webViewBottomTabbar
                } // vstack
                .navigationTitle(Text("네이게이션 타이틀"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: siteMenu, trailing: Button(action: {
                    print("trailing Button")
                }, label: {
                    Text("트레일링")
                }))
            } // zstack
        } // navigationView
        
    }
    
    var siteMenu: some View {
        Menu {
            Button {
                print("정대리 웹뷰 이동")
            } label: {
                Text("정대리 웹뷰 이동") 
            }
            Button {
                print("네이버로 이동")
            } label: {
                Text("네이버로 이동")
            }
            Button {
                print("구글 이동")
            } label: {
                Text("구글 이동")
            }
        } label: {
            Text("사이트로 이동")
        }
    }
    
    var webViewBottomTabbar: some View {
        VStack {
            Divider()
            HStack {
                Spacer()
                Button {
                    print("뒤로가기")
                } label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                }
                Group {
                    Divider()
                    Spacer()
                    Divider()
                }
                
                Button {
                    print("앞으로 가기")
                } label: {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 20))
                }
                Group {
                    Divider()
                    Spacer()
                    Divider()
                }
                Button {
                    print("새로고침")
                } label: {
                    Image(systemName: "goforward")
                        .font(.system(size: 20))
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
