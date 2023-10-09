//
//  RandomUserViewModel.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>() // disposeBag 같은 느낌이네
    
    @Published var randomUserList = [randomUserUseData]()
    
    init() {
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(RandomUserAPi.requestAll.url)
            .publishDecodable(type: RandomUser.self)
            .compactMap {  // opitonal Value unwrap
                $0.value
            }
            .sink { completion in
                print("데이터스트림 완료")
            } receiveValue: { receivedValue in
                print(receivedValue)
                receivedValue.results.forEach { item in
                    self.randomUserList.append(randomUserUseData(name: item.name.first + " " + item.name.last, imageURL: item.picture.large))
                }
                
            }.store(in: &subscription)

    }
}
