//
//  CombineTest.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import Combine

class CombineTest {
    
    let subject = PassthroughSubject<Int, Never>()
    
    let currentValue = CurrentValueSubject<Int, Never>(0)
    
    
    init() {
        subject.send(1) // 값을 발행
        subject.send(2)
        subject.send(completion: .finished) // 완료 이벤트 발
        
        currentValue.value

    }
}
