`//
//  ContentView.swift
//  SwiftUI_Alamofire_Combine_tutorial
//
//  Created by 최윤제 on 2023/10/09.
//

import SwiftUI
import UIKit

import URLImage
import SwiftUI
import SwiftUIIntrospect

class RefreshControlHelper {
    
    var parentContentView: ContentView?
    var refreshControl: UIRefreshControl?
    
    @objc func didRefresh() {
        guard let parentContentView, let refreshControl else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            
            parentContentView.viewModel.refreshActionSubject.send()
            
            refreshControl.endRefreshing()
        }
    }
    
}

struct randomUserUseData: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
}

extension randomUserUseData: Equatable {
    static func == (lhs: randomUserUseData, rhs: randomUserUseData) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ContentView: View {
    
    @ObservedObject var viewModel = RandomUserViewModel()
    
    let refreshControlHelper = RefreshControlHelper()
    
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
                .onAppear {
                    if self.viewModel.randomUserList.last == item {
                        viewModel.fetchMoreActionSubject.send()
                    }
                }
            }
            .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { tableView in
                
                let myRefresh = UIRefreshControl()
                
                refreshControlHelper.refreshControl = myRefresh
                refreshControlHelper.parentContentView = self
                myRefresh.addTarget(refreshControlHelper, action: #selector(RefreshControlHelper.didRefresh), for: .valueChanged)
                
                tableView.refreshControl = myRefresh
            }
            .listStyle(PlainListStyle())

            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                    .scaleEffect(1.8, anchor: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
