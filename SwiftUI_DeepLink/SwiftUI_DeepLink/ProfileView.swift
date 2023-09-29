//
//  ProfileView.swift
//  SwiftUI_DeepLink
//
//  Created by 최윤제 on 2023/09/29.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("프로필")
            .font(.system(size: 30))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(width: 120, height: 120)
            .background(.purple)
            .cornerRadius(20)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
