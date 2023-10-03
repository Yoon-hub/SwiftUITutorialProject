//
//  ContentView.swift
//  SwiftUI_Menu_tutorial
//
//  Created by 최윤제 on 2023/10/03.
//

import SwiftUI

struct ContentView: View {
    
    let myPet = ["멍멍이", "야옹이", "뮹융이"]
    
    @State private var shouldAlert: Bool = false
    @State private var text = ""
    @State private var selected: Int = 0
    
    var body: some View {
        NavigationView {
            Text(myPet[selected])
                .font(.system(size: 60))
                .fontWeight(.bold)
            .navigationTitle("하이요")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu { // VStatck 처럼 동작
                        Button {
                            print("버튼클릭")
                            self.text = "첫번째 버튼"
                            self.shouldAlert = true
                        
                        } label: {
                            Label("풀타올라", image: "flame.fill")
                        }
                        
                        Button {
                            print("버튼클릭")
                            self.text = "두번째 버튼"
                        } label: {
                            Label("집에", image: "person")
                        }
                        
                        Section {
                            Button {
                                print("섹션 버튼")
                                self.text = "섹션 버"
                            } label: {
                                Label("집에", image: "person")
                            }
                        }
                        
                        Button {
                            print("버튼클릭")
                            self.text = "네번째 버튼"
                        } label: {
                            Label("집에", image: "person")
                        }
                        
                        Button {
                            print("버튼클릭")
                            self.text = "네번째 버튼"
                        } label: {
                            Label("집에", image: "person")
                        }

                        Picker(selection: $selected, label: Text("피커")) {
                            ForEach(myPet.indices, id: \.self) { index in
                                Text(myPet[index])
                            }
                        }
                    


                    } label: {
                        Circle()
                            .foregroundColor(Color.yellow)
                            .frame(width: 50, height: 50)
                            .overlay (
                                Label("메뉴", systemImage: "gear")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            .alert(isPresented: $shouldAlert) {
                Alert(title: Text("알림창"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

