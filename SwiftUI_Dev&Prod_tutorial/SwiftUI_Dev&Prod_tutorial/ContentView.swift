//
//  ContentView.swift
//  SwiftUI_Dev&Prod_tutorial
//
//  Created by 최윤제 on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    
    func subscribeTest() {
        let publisher = ["won"].publisher

        publisher
            .map { _ in print(Thread.isMainThread) } // true
            .map { print(Thread.isMainThread) } // false
            .map { print(Thread.isMainThread) } // false
            .sink { print(Thread.isMainThread) } // false
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear() {
            subscribeTest()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
