//
//  View+.swift
//  SwiftUI_CustomPlaceHolder
//
//  Created by 최윤제 on 2023/11/01.
//

import Foundation
import SwiftUI

extension View {
    
    // 텍스트필드 커스텀 플레이스 홀더
    func placeholder(shouldShow: Bool, alignment: Alignment = .leading, placeHolderText: () -> some View) -> some View {
        
        ZStack(alignment: alignment) {
            placeHolderText().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
}
