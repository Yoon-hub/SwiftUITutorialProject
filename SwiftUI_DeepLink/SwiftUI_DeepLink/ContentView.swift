//
//  ContentView.swift
//  SwiftUI_DeepLink
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                Text("프로필")
                    .tabItem {
                        Image(systemName: "person.circle")
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
