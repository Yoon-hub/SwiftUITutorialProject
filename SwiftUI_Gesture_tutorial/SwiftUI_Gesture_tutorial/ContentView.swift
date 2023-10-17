//
//  ContentView.swift
//  SwiftUI_Gesture_tutorial
//
//  Created by 최윤제 on 2023/10/17.
//

import SwiftUI

struct ContentView: View {
    
    var singleTap: some Gesture {
        TapGesture()
            .onEnded { _ in
                print("한번 탭했다.")
            }
    }
    
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                print("더블 탭했다.")
            }
    }
    
    var tripleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                print("트리플 탭했다.")
            }
    }

    
    var body: some View {
        
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay {
                    Text("싱글탭")
                        .cirCleTitle()
                }
                .gesture(singleTap )
            Circle()
                .fill(Color.gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay {
                    Text("더블탭")
                        .cirCleTitle()
                }
                .gesture(doubleTap)
            Circle()
                .fill(Color.green)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay {
                    Text("트리플탭")
                        .cirCleTitle()
                }
                .gesture(tripleTap)
                
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func cirCleTitle() -> some View {
        self.modifier(CirCleTitle())
    }
}

struct CirCleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .foregroundColor(.white)
    }
}
