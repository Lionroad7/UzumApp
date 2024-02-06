//
//  Color.swift
//  Uzum Tezkor App
//
//  Created by islombek on 24/01/24.
//

import UIKit

extension UIColor {
    
    static let appColor = AppColor()
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    struct AppColor {
        let upText: UIColor = .rgb(r: 217, g: 226, b: 244)
        let houseIcon: UIColor = .rgb(r: 69, g: 24, b: 128)
        let searchbarTf: UIColor = .rgb(r: 0.95, g: 0.95, b: 0.95)
        let searchbarTint: UIColor = .rgb(r: 68, g: 24, b: 128)
            
    }
}
