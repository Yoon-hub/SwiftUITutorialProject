//
//  MyView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/25.
//

import SwiftUI

struct MyView: View {
    
    var text: String?
    var color: Color?
    
    var body: some View {
        ZStack {
            color
                //.edgesIgnoringSafeArea(.all)
            Text(text!)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .fontWeight(.bold)
        
        }.animation(.none)
        
    }
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(text: "1", color: .yellow)
    }
}

