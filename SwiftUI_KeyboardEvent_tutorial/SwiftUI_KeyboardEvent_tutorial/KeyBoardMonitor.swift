//
//  KeyBoardMonitor.swift
//  SwiftUI_KeyboardEvent_tutorial
//
//  Created by 최윤제 on 2023/11/01.
//

import Foundation
import Combine
import UIKit

final class KeyBoardMonitor: ObservableObject {
    
    enum Status {
        case show, hide
        var description: String {
            switch self {
            case .show:
                return "보임"
            case .hide:
                return "안보임"
            }
        }
    }
    
    //   @Published var updatedKeyBooardStatusACtion: Status = .hide
    @Published var keyboardHeight: CGFloat = 0
    lazy var updatedKeyBooardStatusACtion: AnyPublisher<Status, Never> = $keyboardHeight.map { (height: CGFloat) -> KeyBoardMonitor.Status in
        return height > 0 ? .show : .hide
    }.eraseToAnyPublisher()
    
    
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        print("키보드 모니터 생성")
        
        //        // 키보드 올라갔을 때 이벤트 받음
        //        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
        //            .sink { noti in
        //                self.updatedKeyBooardStatusACtion = .show
        //            }.store(in: &subscriptions)
        //
        //        // 키보드 내려갈 때
        //        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
        //            .sink { noti in
        //                self.updatedKeyBooardStatusACtion = .hide
        //                self.keyboardHeight = 0
        //            }.store(in: &subscriptions)
        //
        //        // 키보드 크기 변경
        //        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification)
        //            .sink { noti in
        //            //    print("키보드 크기 변경 감지")
        //                let keyboardFrame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        //
        //                print(keyboardFrame.height)
        //                self.keyboardHeight = keyboardFrame.height
        //            }.store(in: &subscriptions)
        
        // 키보드 올라갔을 때 이벤트 받음
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
            .compactMap {  $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            }.map { $0.height }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.keyboardHeight)) //
        
        
        // 키보드 내려갈 때
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
            .compactMap { _ in CGRect.zero.height}
            .subscribe(Subscribers.Assign(object: self, keyPath: \.keyboardHeight))
    }
}
