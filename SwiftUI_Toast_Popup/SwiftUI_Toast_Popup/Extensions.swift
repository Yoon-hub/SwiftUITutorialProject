//
//  Extensions.swift
//  SwiftUI_Toast_Popup
//
//  Created by 최윤제 on 2023/09/27.
//

import SwiftUI

extension Color {
    
    init(hexCode: String) {
        let scanner = Scanner(string: hexCode)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0x00ff00) >> 8
        let blue = rgbValue & 0x0000ff
        
        self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff)
        
    }
}
