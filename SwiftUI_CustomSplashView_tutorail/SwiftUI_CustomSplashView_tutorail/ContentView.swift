//
//  ContentView.swift
//  SwiftUI_CustomSplashView_tutorail
//
//  Created by 최윤제 on 2023/11/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var isContentReady = false
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            if !isContentReady {
                mysplashView.transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isContentReady.toggle()
                }
            }
        
        }
        
    }
}

extension ContentView {
    var mysplashView: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            Text("스플래시 화면")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
