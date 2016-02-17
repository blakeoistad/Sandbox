//
//  UIImageExtensions.swift
//  ExtensionsDemo
//
//  Created by Kevin McNeish on 10/6/14.
//  Copyright (c) 2014 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    var halfSizeImage: UIImage?
    {
        let halfWidth = self.size.width / 2
            let halfHeight = self.size.height / 2
            UIGraphicsBeginImageContext(CGSize(width: halfWidth, height: halfHeight))
            self.drawInRect(CGRectMake(0, 0, halfWidth, halfHeight))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        return image
    }
}