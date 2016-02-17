//
//  StringExtensions.swift
//  ExtensionsDemo
//
//  Created by Kevin McNeish on 10/5/14.
//  Copyright (c) 2014 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func occurrencesOfString(aString: String) -> Int
    {
        var occurrences: Int = 0
        // Set the initial range to the full string
        var range: Range<String.Index>? = self.startIndex..<self.endIndex
        
        while range != nil
        {
            // Search for the string in the current range
            range = self.rangeOfString(aString,
                options: NSStringCompareOptions.CaseInsensitiveSearch,
                range: range,
                locale: nil)
            
            if range != nil
            {
                // String was found, move the range
                range = range!.endIndex..<self.endIndex
                // Increment the number of occurrences
                occurrences++
            }
        }
        return occurrences
    }
    
    // Returns a range of characters (e.g. s[0...3])
    subscript (r: Range<Int>) -> String {
        let start = self.startIndex.advancedBy(r.startIndex)
        let end = self.startIndex.advancedBy(r.endIndex)
        return substringWithRange(Range(start: start, end: end))
    }
    
    // Returns the nth character (e.g. s[1])
    subscript (i: Int) -> String {
        
        return self[i...i]
    }
}



