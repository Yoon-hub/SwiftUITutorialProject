//
//  ContentView.swift
//  SwiftUI_ScrollView_Offset_tutorial
//
//  Created by 최윤제 on 2023/11/08.
//

import SwiftUI

import SwiftUIIntrospect

struct ContentView: View {
    
    @State var dummyEmojies: [String] = []
    //
    @StateObject var scrollViewHelper: ScrollViewHelper
    
    init() {
        self._scrollViewHelper = StateObject.init(wrappedValue: ScrollViewHelper())
        //self.scrollViewHelper = ScrollViewHelper()
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dummyEmojies, id: \.self) {
                    Text($0)
                        .font(.system(size: 40))
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                        .padding([.bottom, .horizontal], 10)
                }
            }
            
            Rectangle()
                .fill(Color.blue)
                .frame(height: 100)
                .background(GeometryReader { proxy in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: proxy.frame(in: .global).minY)
                })
            
                
        }.onAppear {
            self.dummyEmojies = getDummyEmojis()
        }
        .onReceive(self.scrollViewHelper.isBottom, perform: { isBottom in
            print("isBottom: \(isBottom)")
        })
        .introspect(.scrollView, on: .iOS(.v14, .v15, .v16, .v17)) { scrollView in
            scrollView.delegate = scrollViewHelper
        }
    }
}

extension ContentView {
    fileprivate func getDummyEmojis() -> [String] {
        var emojis: [String] = []
        
        for i in 0x1F601...0x1F64F {
            emojis.append(String(UnicodeScalar(i)!))
        }
        
        return emojis
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
