//
//  QRCodeGuideLineView.swift
//  SwiftUI_QR
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct QRCodeGuideLineView: View {
    
    let centerPostion: (GeometryProxy) -> CGPoint = { proxy in
            return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
        }
    
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [11]))
                .frame(width: proxy.size.width / 2, height: proxy.size.height / 3)
                .foregroundColor(.yellow)
                .position(centerPostion(proxy))
        }
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}

