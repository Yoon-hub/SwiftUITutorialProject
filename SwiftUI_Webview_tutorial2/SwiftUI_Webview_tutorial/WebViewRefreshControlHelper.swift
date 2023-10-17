//
//  WebViewRefreshControlHelper.swift
//  SwiftUI_Webview_tutorial
//
//  Created by Jeff Jeong on 2021/09/12.
//  Copyright © 2021 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit

class WebViewRefreshControlHelper {
    
    var refershControl: UIRefreshControl?
    var viewModel: WebViewModel?
    
    //리프래시 컨트폴에 붙일 메소드
    @objc func didRefresh() {
        print("리프래시 컨트롤 호출")
        
        guard let refershControl, let viewModel else { return }
        
        viewModel.webNavigationSubject.send(.REFRESH)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            refershControl.endRefreshing()
        }
    
    }
    
}
