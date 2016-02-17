//
//  CustomColors.swift
//
//
//  Created by Blake Oistad on 11/11/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

import UIKit

public extension UIColor {

    class func colorWithRGB(rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0xFF) / 255
        
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    func 
}
