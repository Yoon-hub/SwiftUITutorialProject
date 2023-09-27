//
//  ContentView.swift
//  SwiftUI_Toast_Popup
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI
import PopupView

struct ContentView: View {
    
    @State var showingPopup = false
    
    @State var catPopUp = false
    
    func makeCatPopUp() -> some View {
        HStack(alignment: .center, spacing: 20) {
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("안내 메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("토스트메세지입니다")
                    .lineLimit(2)
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                Divider().opacity(0)
            }
        }
        .padding(15)
        .frame(width: 300)
        .background(.green)
        .cornerRadius(20)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    self.showingPopup = true
                } label: {
                    Text("토스트띄우기")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(.blue)
                        .cornerRadius(15)
                }
                
                Button {
                    self.catPopUp = true
                } label: {
                    Text("고양이")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(.green)
                        .cornerRadius(15)
                }
                
                Button {
                    self.catPopUp = true
                } label: {
                    Text("고양이")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color(hexCode: "8227b0"))
                        .cornerRadius(15)
                }


            }
        }
        .popup(isPresented: $showingPopup) {
            Text("The popup")
                .frame(width: 200, height: 60)
                .background(.secondary)
        } customize: {
            $0
                .type(.toast)
                .position(.bottom)
                .autohideIn(1)
        }
        
        .popup(isPresented: $catPopUp) {
            makeCatPopUp()
        }customize: {
            $0
                .type(.floater())
                .position(.bottom)
                .autohideIn(1)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
