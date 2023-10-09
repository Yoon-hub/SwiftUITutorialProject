//
//  ContentView.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import SwiftUI

import URLImage
import SwiftUI

struct randomUserUseData: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
}

struct ContentView: View {
    
    @ObservedObject var viewModel = RandomUserViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.randomUserList) { item in
                HStack {
                    URLImage(URL(string: item.imageURL)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .cornerRadius(35)
                            .overlay {
                                Circle().stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    Text(item.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding()
//        .task {
//            APIService.shared.apiIntegration(type: RandomUser.self, api: .requestAll, method: .get) { result, statusCode in
//                
//                switch result {
//                case .success(let data):
//                    print(data.results)
//                    data.results.forEach { item in
//                        randomUserList.append(randomUserUseData(name: item.name.first + " " + item.name.last, imageURL: item.picture.large))
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//                
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
