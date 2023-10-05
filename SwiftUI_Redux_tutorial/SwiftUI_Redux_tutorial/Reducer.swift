//
//  Reducer.swift
//  SwiftUI_Redux_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    case .rollTheDice:
        state.currentDice = [ "⚀", "⚁", "⚂", "⚃", "⚄", "⚅"].randomElement()!
    }
}

