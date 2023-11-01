//
//  APILogger.swift
//  SwiftUI_OAuthAlamofire_tutorial
//
//  Created by 최윤제 on 2023/10/25.
//

import Foundation
import Alamofire

final class APILogger: EventMonitor {
    let queue = DispatchQueue(label: "OAuth_Alarmofire_tutorialLogger")

    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
        print("🥰Resuming: \(request)")
    }

    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("🥰Finished: \(response)")
    }
}
