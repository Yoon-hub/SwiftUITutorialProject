//
//  ListView.swift
//  SwiftUI_DeepLink
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ListView: View {
    
    var workList: [String] = ["책 읽기", "공부하기", "테스트", "Tuist", "PinLayout"]
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(workList, id: \.self) { item in
                    NavigationLink(destination: Text("\(item)")) {
                        Text(item)
                            .foregroundColor(.black)
                    }
                
                }
            }
        }
        .navigationBarTitle(Text("할일 목록"))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
