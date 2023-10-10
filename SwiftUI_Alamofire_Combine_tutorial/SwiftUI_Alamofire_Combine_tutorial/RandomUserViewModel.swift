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
    
    @Published var pageInfo: Info? {
        didSet {
            print("pageInfo: \(pageInfo?.page)")
        }
    }
    
    @Published var isLoading: Bool = false
    
    var refreshActionSubject = PassthroughSubject<Void, Never>()
    var fetchMoreActionSubject = PassthroughSubject<Void, Never>()
    
    init() {
        fetchRandomUsers()
         
        refreshActionSubject.sink { [weak self] _ in
            self?.fetchRandomUsers()
        }.store(in: &subscription)
        
        fetchMoreActionSubject.sink { [weak self] _ in
            if !self!.isLoading {
                self?.fetchMore()
            }
        }.store(in: &subscription)
    }
    
    fileprivate func fetchMore() {
        guard let currentPage = pageInfo?.page else {return}
        
        let pageToLoad = currentPage + 1
        
        self.isLoading = true
        
        AF.request(RandomUserRouter.getUsers(page: pageToLoad))
            .publishDecodable(type: RandomUser.self)
            .compactMap {  // opitonal Value unwrap
                $0.value
            }
            .sink { completion in
                print("데이터스트림   완료")
                self.isLoading = false
            } receiveValue: { receivedValue in
                print(receivedValue)
                receivedValue.results.forEach { item in
                    self.randomUserList.append(randomUserUseData(name: item.name.first + " " + item.name.last, imageURL: item.picture.large))
                }
                self.pageInfo = receivedValue.info
                
            }.store(in: &subscription)
    }
    
    func fetchRandomUsers() {
        
        randomUserList = []
        
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUser.self)
            .compactMap {  // opitonal Value unwrap
                $0.value
            }
            .sink { completion in
                print("데이터스트림   완료")
            } receiveValue: { receivedValue in
                print(receivedValue)
                receivedValue.results.forEach { item in
                    self.randomUserList.append(randomUserUseData(name: item.name.first + " " + item.name.last, imageURL: item.picture.large))
                }
                self.pageInfo = receivedValue.info
                
            }.store(in: &subscription)

    }
}
