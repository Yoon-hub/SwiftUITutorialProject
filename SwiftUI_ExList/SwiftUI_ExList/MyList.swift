//
//  MyList.swift
//  SwiftUI_ExList
//
//  Created by VP on 2023/09/19.
//

import SwiftUI

struct MyList: View {
    var body: some View {
        List {
            ForEach(1...10, id: \.self) {
                MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .green)
            }
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}

