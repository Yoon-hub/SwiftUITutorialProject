//
//  ContentView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import SwiftUI

struct ContentView: View {
    
    let store = AppStore(state: AppState.init(currentDice: "⚀"), reducer: appReducer(state:action:))
    
    var body: some View {
        Text("아아아")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .background(Color.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
