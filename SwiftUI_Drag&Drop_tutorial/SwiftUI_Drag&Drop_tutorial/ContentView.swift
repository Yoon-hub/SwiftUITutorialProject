//
//  ContentView.swift
//  SwiftUI_Drag&Drop_tutorial
//
//  Created by 최윤제 on 2023/10/18.
//

import SwiftUI

struct DataItem: Hashable, Identifiable {
    var id: UUID
    var title: String
    var color: Color
    
    init(title: String, color: Color) {
        id = UUID()
        self.title = title
        self.color = color
    }
}

struct ContentView: View {
    
    @State private var dataList = [
        DataItem(title: "1번", color: .yellow),
        DataItem(title: "2번", color: .green),
        DataItem(title: "3번", color: .orange)
        
    ]
    
    @State var isEditMode: Bool = false
    @State var draggedItem: DataItem?
    
    var body: some View {
        Toggle("수정모드", isOn: $isEditMode)
        LazyVStack {
            ForEach(dataList, id: \.self) { item in
                Text(item.title)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(item.color)
                    .onDrag {
                        self.draggedItem = item
                        return NSItemProvider(item: nil, typeIdentifier: item.title)
                    }
                    .onDrop(of: [item.title], delegate: MyDropDelegate(currentItem: item, dataList: $dataList, draggedItem: $draggedItem, isEditMode: $isEditMode))
                    
            }
        }
        .onChange(of: isEditMode) { newValue in
            print(newValue)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyDropDelegate: DropDelegate {
    
    let currentItem: DataItem
    @Binding var dataList: [DataItem]
    @Binding var draggeditem: DataItem?
    @Binding var isEditMode: Bool
    

    init(currentItem: DataItem, dataList: Binding<[DataItem]>, draggedItem: Binding<DataItem?>, isEditMode: Binding<Bool>) {
        self.currentItem = currentItem
        self._dataList = dataList
        self._draggeditem = draggedItem
        self._isEditMode = isEditMode
    }
    
    
    
    // 드랍 벗어났을 때
    func dropExited(info: DropInfo) {
        
    }

    // 드랍 업데이트
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return nil
    }
    
    // Drop 처리
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    // 드랍 유효
    func validateDrop(info: DropInfo) -> Bool {
        return true
    }
    
    //드랍 시작
    func dropEntered(info: DropInfo) {
        
        if !isEditMode {return}
        guard let draggeditem = self.draggeditem else {return}
        
        // 드래깅된 아이템이랑 현재 내 아이템이랑 다르면
        if draggeditem != currentItem {
            let from = dataList.firstIndex(of: draggeditem)!
            let to = dataList.firstIndex(of: currentItem)!
            
            withAnimation {
                self.dataList.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
        
    }
}
