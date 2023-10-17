//
//  ContentView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import SwiftUI

struct ContentView: View {
    
    let store = AppStore(state: AppState.init(currentDice: "⚀"), reducer: appReducer(state:action:))

//    var body: some View {
//        Text("아아아")
//            .font(.system(size: 20))
//            .fontWeight(.bold)
//            .foregroundColor(Color.white)
//            .padding()
//            .background(Color.purple)
//    }
    
        var body: some View {
            ZStack {
                Color.white
                VStack (spacing: 60){
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .background(Color.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 20)
                        }

                    Rectangle()
                        .frame(width: 120, height: 120)
                        .background(Color.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(lineWidth: 20, antialiased: true)
                                .cornerRadius(20)
                                .foregroundColor(Color.red)
                        }
                }

            }

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
