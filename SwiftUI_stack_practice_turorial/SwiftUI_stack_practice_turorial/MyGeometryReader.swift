//
//  MyGeometryReader.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/21.
//

import SwiftUI

struct MyGeometryReader: View {
    
    @State private var color: Int = 0
    
    let centerPostion: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center, spacing: 0){
                
                Button {
                    withAnimation {
                        color = 0
                    }
                } label: {
                    Text("빨")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: color == 0 ? 120 : 60,height: geometry.size.height/3)
                        .background(.red)
                }
                
                Button {
                    withAnimation {
                        color = 1
                    }
                } label: {
                    Text("주")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: color == 1 ? 120 : 60,height: geometry.size.height/3)
                        .background(.orange)
                }
                
                Button {
                    withAnimation {
                        color = 2
                    }
                } label: {
                    Text("노")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: color == 2 ? 120 : 60,height: geometry.size.height/3)
                        .background(.yellow)

                }
            }
            .frame(width: geometry.size.width)
            .position(centerPostion(geometry))
        }
        
        
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}

