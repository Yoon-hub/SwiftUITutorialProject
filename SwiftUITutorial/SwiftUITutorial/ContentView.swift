//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by 최윤제 on 2023/09/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActivated: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    // 에니메이션과 함께
                    withAnimation {
                        self.isActivated.toggle()
                    }
                } // Hstack
                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(30)
                }
            }
        } // navi

    }
}
 
struct MyVstackView: View {
    
    // 데이터를 연동시킨다.
    @Binding var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(true)) {
        self._isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello")
                .fontWeight(.bold)
                .font(.system(size: 30))
            
        }
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
