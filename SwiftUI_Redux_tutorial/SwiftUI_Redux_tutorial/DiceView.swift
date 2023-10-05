//
//  DeiceView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by 최윤제 on 2023/10/04.
//

import SwiftUI

struct DiceView: View {
    
    @EnvironmentObject var store: AppStore
    
    func rollTheDice() {
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(self.store.state.currentDice)
                .font(.system(size: 300))
                .foregroundColor(Color.purple)
            
            Button {
                self.rollTheDice()
            } label: {
                Text("랜덤 주사위 돌리기")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(20)
            
            }

        }
        
        
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}

