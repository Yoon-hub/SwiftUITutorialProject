//
//  SwiftUI_OAuthAlamofire_tutorialApp.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/24.
//

import SwiftUI

@main
struct SwiftUI_OAuthAlamofire_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserViewModel())
        }
    }
}
