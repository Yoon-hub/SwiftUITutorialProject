//
//  MyNavigationView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/19.
//

import SwiftUI

struct MyNaviagtionView: View {
    var body: some View {
        NavigationView {

            MyListView()
                .navigationTitle("안녕하세요!")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(leading: Button(action: {
                    print("버튼 클릭")
                }, label: {
                    Image(systemName: "bell")
                }), trailing: NavigationLink(destination: {
                    Text("넘어온 화면입니다.")
                }, label: {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.green)
                }))
        }
        
        
    }
}

struct MyNaviagtionView_Previews: PreviewProvider {
    static var previews: some View {
        MyNaviagtionView()
    }
}
