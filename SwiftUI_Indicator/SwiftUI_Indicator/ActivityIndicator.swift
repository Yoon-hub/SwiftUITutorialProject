//
//  ActivityIndicator.swift
//  SwiftUI_Indicator
//
//  Created by 최윤제 on 2023/11/10.
//

import Foundation
import SwiftUI

struct ActivityIndicator: View {
    
    @State var currentDegrees = 0.0
    
    var blueGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.75), Color.blue.opacity(0.5), Color.blue.opacity(0.2), Color.clear]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(blueGradient, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            //.stroke(lineWidth: 4)
            .frame(width: 60, height: 60)
            .rotationEffect(Angle(degrees: currentDegrees))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                    withAnimation {
                        self.currentDegrees += 20
                    }
                    
                }
            }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var  previews: some View {
        ActivityIndicator()
    }
}

