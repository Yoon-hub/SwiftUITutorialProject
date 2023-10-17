//
//  MyTextAlertView.swift
//  SwiftUI_JSCommunication_tutorail
//
//  Created by 최윤제 on 2023/10/11.
//

import Foundation
import SwiftUI
import UIKit

struct MyTextAlertView: UIViewControllerRepresentable {
    
    @Binding var textString: String
    @Binding var showAlert: Bool
    
    var title: String
    var message: String
    
    
    //처음
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyTextAlertView>) -> some UIViewController {
        return UIViewController()
    }
    
    //값이 변경 시
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<MyTextAlertView>) {
        
//        guard context.coordinator.uiAlertController == nil else { return }
        
        if self.showAlert {
            let uiAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            uiAlertController.addTextField(configurationHandler: { textField in
                textField.placeholder = "전달할 값을 입력하세요"
                textField.text = textString
            })
            
            uiAlertController.addAction(UIAlertAction(title: "취소", style: .destructive) { _ in
                print("취소가 클릭되었다")
                self.textString = ""
            })
            
            uiAlertController.addAction(UIAlertAction(title: "보내기", style: .default) { _ in
                if let textField = uiAlertController.textFields?.first, let inputText = textField.text {
                    self.textString = inputText
                }
                
                uiAlertController.dismiss(animated: true) {
                    print("보내기 버튼 클릭")
                    self.showAlert = false
                }
            })
            
            DispatchQueue.main.async {
                uiViewController.present(uiAlertController, animated: true) {
                    self.showAlert = false
                    context.coordinator.uiAlertController = nil
                }
            }
        }
        
  
        
    }
    
    func makeCoordinator() -> MyTextAlertView.Coordinator {
        MyTextAlertView.Coordinator(self)
    }
    
    
    // 중간에 매개
    class Coordinator: NSObject {
        var uiAlertController: UIAlertController?
        
        var myTextAlertView: MyTextAlertView
        
        init(_ myTextAlertView: MyTextAlertView) {
            self.myTextAlertView = myTextAlertView
        }
    }
}

extension MyTextAlertView.Coordinator: UITextFieldDelegate {
    // 글자가 입력이 될때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text as NSString? {
            self.myTextAlertView.textString = text.replacingCharacters(in: range, with: string)
        } else {
            self.myTextAlertView.textString = ""
        }
        return true
    }
}

