//
//  ScrollViewOffsetpreferenceKey.swift
//  SwiftUI_ScrollView_Offset_tutorial
//
//  Created by 최윤제 on 2023/11/09.
//

import Foundation
import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey { // 자식 뷰에서 부모뷰로 이벤트 전달
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

}

