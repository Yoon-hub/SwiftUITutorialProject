//
//  ContentView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack {
                        NavigationLink(destination: MyListView(isNaviagtionBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 30))
                        
                    }
                    
                    Text("천원 할 일목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                    
                    
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MyBasicCard()
                            MyCard(icon: "tray.fill", title: "책상 정리", start: "1 PM", end: "3 PM", bgColor: .blue)
                            MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: .green)
                            MyCard(icon: "cert.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: .red)
                        }
                        
                    }
                    
                }.padding(10)
                
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, 10)
                    .shadow(radius: 10) // 그림자 범위
                
            }
            .navigationTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
