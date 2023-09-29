//
//  ContentView.swift
//  SwiftUI_DeepLink
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = TabIdentifier.todo
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab, content: {
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }.tag(TabIdentifier.todo)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                    }.tag(TabIdentifier.profile)
            })
            .onOpenURL { url in
                guard let tabId = url.tabIdentifier else { return }
                selectedTab = tabId
                            
            }
               
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// 어떤 탭
enum TabIdentifier: Hashable {
    case todo
    case profile
}


// 어떤 페이지
enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    
    var isDepplink: Bool {
        return scheme == "deeplink-swiftui"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDepplink else { return nil }
        
        switch host {
        case "todo":
            return .todo
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        guard let tabId = tabIdentifier, pathComponents.count > 1, let uuid = UUID(uuidString: pathComponents[1]) else { return nil }
        
        switch tabId {
        case .todo:
            return .todoItem(id: uuid)
        case .profile:
            return .todoItem(id: uuid)
        }
    }
    
}
