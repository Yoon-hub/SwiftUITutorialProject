//
//  MyFilterList.swift
//  SwiftUI_Picker_Tutorial
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

enum School: String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

struct MyFriend: Identifiable, Hashable { // 친구 모델 생성
    var id = UUID()
    var name: String
    var school: School
}

struct MyFilteredList: View {
    
    @State private var filteredValue = School.elementary
    @State private var myFriendsList = [MyFriend]()
    @State private var test = 3
    
    init() {
        var newList = [MyFriend]()
        
        for i in 0...20 {
            newList.append(MyFriend(name: "친구 \(i)", school: School.allCases.randomElement()!))
        }
        
        _myFriendsList = State(initialValue: newList) // State 속성 초기화
    }
    
    var body: some View {
        VStack {
            Text("선택된 필터: \(filteredValue.rawValue)")
            Picker("피커", selection: $filteredValue) {
                Text("초등학교").tag(School.elementary)
                Text("중학교").tag(School.middle)
                Text("고등학교").tag(School.high)
            }
            .pickerStyle(.segmented)
            
            List {
                
                ForEach(myFriendsList.filter({ $0.school == filteredValue })) { item in
                    HStack {
                        Text("name: \(item.name)")
                        Text("School: \(item.school.rawValue)")
                    }
                }
                
//                ForEach(myFriendsList, id: \.self) { item in
//                    HStack {
//                        Text("name: \(item.name)")
//                        Text("School: \(item.school.rawValue)")
//                    }
//
//                }
            }
            
        }
//        .onAppear() {
//            var newList = [MyFriend]()
//
//            for i in 0...20 {
//                newList.append(MyFriend(name: "친구 \(i)", school: School.allCases.randomElement()!))
//            }
//
//           // _myFriendsList = State(initialValue: newList)
//            myFriendsList = newList
//        }

    }
}

struct MyFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        MyFilteredList()
    }
}

