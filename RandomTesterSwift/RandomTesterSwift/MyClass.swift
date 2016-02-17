//
//  MyClass.swift
//  RandomTesterSwift
//
//  Created by Blake Oistad on 1/5/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class MyClass: NSObject {

    class func getStartTime() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .NoStyle
        formatter.timeStyle = .MediumStyle
        let currentDate = NSDate()
        let startTime = formatter.stringFromDate(currentDate)
        return startTime
    }
    
}
