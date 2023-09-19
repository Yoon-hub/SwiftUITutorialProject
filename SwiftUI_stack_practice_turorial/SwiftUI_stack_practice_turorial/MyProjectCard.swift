//
//  MyProjectCard.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/18.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text("천원 블로그 구독")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10AM - 11AM")
                .foregroundColor(.secondary)
            Spacer().frame(height: 20)
            HStack {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .overlay(
                        Circle().stroke(lineWidth: 5)
                            .foregroundColor(.red)
                    )
                    .clipShape(Circle())
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                
                Button {
                    print("확인 버튼이 클릭되없습니다.")
                    self.shouldShowAlert = true
                } label: {
                    Text("확인")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창입니다."))
                }

                

                    
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
