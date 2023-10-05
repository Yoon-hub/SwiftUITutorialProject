//
//  AppStroe.swift
//  SwiftUI_Redux_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import Foundation

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    
    // 외부에서 읽을수만 있도록
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
         reducer(&state, action)
    }
}
 
