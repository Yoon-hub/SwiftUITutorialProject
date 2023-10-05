//
//  MyPickerGrdieView.swift
//  SwiftUI_lazyVGrid_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import SwiftUI

enum LayoutType {
    case half
    case full
}

extension LayoutType {
    
    var column: [GridItem] {
        if self == .half {
            return [GridItem(.fixed(100)),
            //GridItem(.adaptive(minimum: 50)),
            GridItem(.flexible(minimum: 50))]
        } else {
            return [GridItem(.flexible(minimum: 50))]
        }
    }
}

struct MyPickerGrideView: View {
    
    @State private var selectionValue: LayoutType = .half
    
    let myData = Array(1...2000).map { return "\($0)번" }
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectionValue) {
                Image(systemName: "bag").tag(LayoutType.half)
                Image(systemName: "bag.fill").tag(LayoutType.full)
                Image(systemName: "creditcard").tag(LayoutType.full)
                
            } label: {
                
            }
            .pickerStyle(.segmented)
            .frame(width: 300)
            ScrollView {
                //Column은 호리젠탈 아이템 레이아웃을 설정하는 부분
                // .fixed 고정
                // .adapative 여러개 채우기 - 채울수 있을 만큼 채우기
                // . flexible은 하나만 채우기 - 하나를 끝까지 채우기
                LazyVGrid(columns: selectionValue.column, alignment: .center, spacing: 10) {
                     
                    ForEach(myData, id: \.self) {
                        Rectangle()
                            .frame(height: 60)
                            .foregroundColor( self.selectionValue == .half ? .blue : .green)
                            .overlay(
                                Text($0)
                            )
                    }
                }
                .animation(.some(.linear))
            }
        }

    }
}

struct MyPickerGrideView_Previews: PreviewProvider {
    static var previews: some View {
        MyPickerGrideView()
    }
}
