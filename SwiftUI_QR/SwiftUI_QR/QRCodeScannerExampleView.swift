//
//  QRCodeScannerExampleView.swift
//  SwiftUI_QR
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        ZStack {
            if let code = scannedCode {
                MyWebView(urlToLoad: self.scannedCode!)
            } else {
                MyWebView(urlToLoad: "https://www.naver.com")
            
            }

            VStack {
                Spacer()
                Button {
                    isPresentingScanner = true
                
                } label: {
                    Text("QR확인")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }

                Spacer().frame(height: 30)
            }

        }
        .sheet(isPresented: $isPresentingScanner) {
            ZStack {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        isPresentingScanner = false
                    }
                }
                QRCodeGuideLineView()
            }
            

        }

    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}

