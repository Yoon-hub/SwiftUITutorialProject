//
//  ContentView.swift
//  SwiftUI_Text_tutorial
//
//  Created by 최윤제 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specim ")
                .tracking(1) // 글자간의 간격을 설정
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading) // Text 정렬
                .lineLimit(nil)
                .lineSpacing(10)
                .shadow(color: Color.red, radius: 4, x: 0, y: 10)
                .truncationMode(.head) // .. 처리 
            
                .padding(.all, 20)
                .background(Color.yellow)
                .cornerRadius(20)
                .padding(10)
                .background(Color.green)
                .cornerRadius(20)
                .padding(10)

                .background(Color.blue)
            Text("안녕하세요")
                .background(Color.gray)
                .foregroundColor(Color.white)
            Text("오늘의 날짜입니다.\(ContentView.dateFormat.string(from: Date()))")
        }

    }
}
struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
