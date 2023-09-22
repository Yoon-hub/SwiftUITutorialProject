//
//  MyListView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/19.
//

import SwiftUI

struct MyListView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNaviagtionBarHidden: Binding<Bool> = .constant(false)) {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        _isNavigationBarHidden = isNaviagtionBarHidden
    }
    
    var body: some View {
        
        List {
            Section(
                header: Text("오늘 할 일")
                    .font(.headline)
                    .foregroundColor(.black)
                ,footer: Text("footer")
                
            ) {
                ForEach(1...3, id: \.self) {
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .green)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)) // item 간에 간격 0으로
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("내일 할 일")
                    .font(.headline)
                    .foregroundColor(.black)
            ) {
                ForEach(1...20, id: \.self) {
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 30, bottom: 10, trailing: 10)) // item 간에 간격 0으로
            .listRowBackground(Color.yellow)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("내 목록")
  //      .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = false
        }
        
    }
}


struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
