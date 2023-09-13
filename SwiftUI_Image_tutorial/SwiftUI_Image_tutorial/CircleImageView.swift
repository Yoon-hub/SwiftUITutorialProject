//
//  CircleImageView.swift
//  SwiftUI_Image_tutorial
//
//  Created by 최윤제 on 2023/09/13.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 10, y: 10) // radius 퍼지는 정도
        Image("sunset")
            .resizable()
            .scaledToFill()
            //.aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(color: .red, radius: 10, x: 5, y: 10)
            .overlay(Circle()
                .foregroundColor(.black)
                .opacity(0.6)
                .padding(30)
            )
            .overlay(Circle()
                .stroke(Color.red, lineWidth: 10)
                .padding(30)
            )
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 10)
                    .padding(10)
            )
            .overlay(
                Text("호호")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            )

        
            //.clipped() // frame 크기에 맞게 자르기
        //    .edgesIgnoringSafeArea(.all)
        
    }
}


struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
