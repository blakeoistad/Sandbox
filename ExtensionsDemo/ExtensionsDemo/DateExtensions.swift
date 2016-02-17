//
//  DateExtensions.swift
//  ExtensionsDemo
//
//  Created by Kevin McNeish on 10/7/14.
//  Copyright (c) 2014 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation

extension NSDate {
    
    enum Month {
        case January, February, March, April, May, June, July, August, September, October, November, December, Unknown
    }

    class var currentMonth: Month {
        let cal = NSCalendar.currentCalendar()
            let flags: NSCalendarUnit = .NSMonthCalendarUnit
            let components = cal.components(flags, fromDate: NSDate())
            let monthNumber = components.month
            switch monthNumber {
            case 1:
                return .January
            case 2:
                return .February
            case 3:
                return .March
            case 4:
                return .April
            case 5:
                return .May
            case 6:
                return .June
            case 7:
                return .July
            case 8:
                return .August
            case 9:
                return .September
            case 10:
                return .October
            case 11:
                return .November
            case 12:
                return .December
            default:
                return .Unknown
            }
    }
}