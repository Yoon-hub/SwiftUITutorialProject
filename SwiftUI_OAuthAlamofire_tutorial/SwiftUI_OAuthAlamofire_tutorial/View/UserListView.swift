//
//  UserListView.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation
import SwiftUI

struct UserListView: View {
    
    @State var users: [UserData] = [
        UserData(id: 0, name: "호호호", email: "kong4170@naver.com", avatar: "fuck")
    ]
    
    var body: some View {
        
        List(users) { item in
            NavigationLink {
                OtherUserProfileView(userData: item)
            } label: {
                HStack {
                    AsyncImage(url: URL(string: item.avatar)!) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 50, height: 50, alignment: .center)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                        case .failure(_):
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.email)
                    }
                    Spacer()
                    
                }
            
            }

        }
        .navigationTitle("사용자 목록")
        .navigationBarTitleDisplayMode(.large)
    
    }
    
}
