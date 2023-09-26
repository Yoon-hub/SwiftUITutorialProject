//
//  MyCustomTabView.swift
//  SwiftUI_stack_practice_turorial
//
//  Created by 최윤제 on 2023/09/25.
//

import SwiftUI

enum TabIndex {
    case home
    case cart
    case profile
}

struct MyCustomTabView: View {
    
    @State var tabIndex: TabIndex
    
    @State var lagerScale: CGFloat = 1.3
    
    let centerPostion: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    }
    
    func chageMyView() -> MyView {
        switch tabIndex {
        case .home:
            return MyView(text: "홈", color: .blue)
        case .cart:
            return MyView(text: "장바구니", color: .purple)
        case .profile:
            return MyView(text: "프로필", color: .green)
        }
    }
    
    func changeIconColor() -> Color {
        switch tabIndex {
        case .home:
            return .blue
        case .cart:
            return .purple
        case .profile:
            return .green
        }

    }
    
    func calcCirCleBgPosition(proxy: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return -(proxy.size.width / 3)
        case .cart:
            return 0
        case .profile:
            return (proxy.size.width / 3)
        }
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                chageMyView()
                
                Circle()
                    .frame(width: 90, height: 90)
                    .offset(x: self.calcCirCleBgPosition(proxy: proxy),y: 0)
                    .foregroundColor(.white)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button {
                            withAnimation {
                                self.tabIndex = .home
                            }
                            
                        } label: {
                            Image(systemName: "house.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .home ? self.lagerScale : 1.0)
                                .foregroundColor(self.tabIndex == .home ? self.changeIconColor() : Color.gray)
                                .frame(width: proxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .home ? -10 : 0)
                                
                        }
                        
                        Button {
                            withAnimation {
                                self.tabIndex = .cart
                            }
                            
                        } label: {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .cart ? self.lagerScale : 1.0)
                                .foregroundColor(self.tabIndex == .cart ? self.changeIconColor() : Color.gray)
                                .frame(width: proxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .cart ? -10 : 0)
                                
                        }
                        
                        Button {
                            withAnimation {
                                self.tabIndex = .profile
                            }
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .profile ? self.lagerScale : 1.0)
                                .foregroundColor(self.tabIndex == .profile ? self.changeIconColor() : Color.gray)
                                .frame(width: proxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .profile ? -10 : 0)
                                
                        }
                    }
                    .background(.white)
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                }
                

            }
            .edgesIgnoringSafeArea(.all)
            .position(centerPostion(proxy))
        }
    }
}

struct MyCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomTabView(tabIndex: .home)
    }
}

