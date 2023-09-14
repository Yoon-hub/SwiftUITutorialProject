//
//  MyZstack.swift
//  SwiftUI_StackView_Tutorial
//
//  Created by 최윤제 on 2023/09/14.
//

import SwiftUI

struct MyZstack: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .zIndex(1) // index 설정이 가능
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
                .zIndex(3) // index 설정이 가능
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .zIndex(2) // index 설정이 가능
        }
    }
}

struct MyZstack_Previews: PreviewProvider {
    static var previews: some View {
        MyZstack()
    }
}


