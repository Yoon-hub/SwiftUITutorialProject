//
//  MyProfileView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/19.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        
        
            ScrollView {
                VStack {
                    Rectangle()
                        .frame(height: 60)
                        .opacity(0)
                    Image("1")
                        .clipShape(Circle())
                        .overlay (
                            Circle()
                                .stroke(lineWidth: 10) // strokeBorder
                                .foregroundColor(.yellow)
                        )
                        .shadow(radius: 10, y: 10)
                        .padding(.bottom, 30)
                    Text("개발하는 정대리")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Text("구독 좋아요 부탁드립니다!")
                        .font(.system(size: 20))
                    
                    HStack {
                        Button {
                            print("구독하러 가기")
                        } label: {
                            Text("구독하러 가기")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.red)
                                .cornerRadius(16)
                        }
                        
                        Button {
                            print("오픈카톡 가기")
                        } label: {
                            Text("구독하러 가기")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.orange)
                                .cornerRadius(16)
                        }
                        
                    }
                    Spacer()
                }
            }
            .navigationTitle("내 프로필")
            .navigationViewStyle(.columns)
            .navigationBarItems(trailing: Button(action: {
                print("profile")
            }, label: {
                Image(systemName: "gear")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            }))
        
        
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

