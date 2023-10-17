//
//  ContentView.swift
//  SwiftUI_ScrollViewReader_tutorial
//
//  Created by 최윤제 on 2023/10/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    @Namespace var topID
    @Namespace var bottomID
    
    var bgColor: (Int, Int) -> Color = { selectIndex, seletedIndex in
        if selectIndex == seletedIndex {
            return .red
        } else {
            return .blue
        
        }
        
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { proxy in
                    
                    Button("Scroll to Bottom") {
                             withAnimation {
                                 proxy.scrollTo(bottomID)
                             }
                         }
                         .id(topID)

                    
                    ForEach(0..<100) { index in
                        Text("오늘도 빡코딩\(index)")
                            .padding()
                            .background(bgColor(index, selectedIndex))
                            .id(index)
                    }
                    .onChange(of: selectedIndex) { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                        
                    }
                    
                    Button("Top") {
                         withAnimation {
                             proxy.scrollTo(topID)
                         }
                     }
                     .id(bottomID)
                }

            }
            
            HStack(spacing: 10) {
                Button {
                    selectedIndex = 0
                } label: {
                    Text("인덱스: 0")
                        .padding()
                }
                
                Button {
                    selectedIndex = 10
                } label: {
                    Text("인덱스: 10")
                        .padding()
                }
                
                Button {
                    selectedIndex = 90
                } label: {
                    Text("인덱스: 90")
                        .padding()
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
