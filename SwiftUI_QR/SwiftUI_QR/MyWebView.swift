//
//  MyWebView.swift
//  SwiftUI_QR
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI
import UIKit
import WebKit


struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: urlToLoad) else {return WKWebView()}
        
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
          
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}

