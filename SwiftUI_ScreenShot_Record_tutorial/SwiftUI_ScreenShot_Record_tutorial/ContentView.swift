//
//  ContentView.swift
//  SwiftUI_ScreenShot_Record_tutorial
//
//  Created by 최윤제 on 2023/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MainView()
            BlockView()
        }
    }
}

struct AlertData: Identifiable {
    var id = UUID()
    var title: String
    var message: String

    init(title: String = "안녕하세요", message: String = "스크린샷 찍지마 임마") {
        self.title = title
        self.message = message
    }
}

struct BlockView: View {
    
    @State var isRecording = false
    @State var alertData: AlertData?
    
    
    var body: some View {
        ZStack {
            if isRecording {
                Color.white
                Text("화면 녹화중임니다")
                    .font(.largeTitle)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification)) { _ in
            isRecording = UIScreen.main.isCaptured // 녹화 확인
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
            alertData = AlertData()
        }
        .alert(item: $alertData) { alertData in
            Alert(title: Text(alertData.title), message: Text(alertData.message), dismissButton: .default(Text("확인")))
        }
    }
}

struct MainView: View {
    var body: some View {
        Color.purple
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
