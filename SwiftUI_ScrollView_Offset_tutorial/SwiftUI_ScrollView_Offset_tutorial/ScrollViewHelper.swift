//
//  ScrollViewHelper.swift
//  SwiftUI_ScrollView_Offset_tutorial
//
//  Created by 최윤제 on 2023/11/08.
//

import Foundation
import UIKit
import Combine

final class ScrollViewHelper: NSObject, UIScrollViewDelegate, ObservableObject {
        
    @Published var isBottomValue: Bool = false
    
    lazy var isBottom: AnyPublisher<Bool, Never> = $isBottomValue.removeDuplicates().eraseToAnyPublisher()
    
    
    let threshold: CGFloat = 0
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("ScrollView Helper: scrollViewDidScroll: \(scrollView.contentOffset.y)")
        
        
        //self.isBottomValue = isScrollBottom(scrollView: scrollView)
       // print("바텀 도착은\(isBottomValue)")
    
        
    }
    
    fileprivate func isScrollBottom(scrollView: UIScrollView) -> Bool {
        // 스크롤 바닥에 도착했는지 판단
     return scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < threshold
    }
}
