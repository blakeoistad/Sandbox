//
//  ViewController.swift
//  blah
//
//  Created by Blake Oistad on 2/1/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("*")
        print("    *")
        print("    *")
        print("Hey mom!")
        
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        formatter.timeStyle = .ShortStyle
        let cleanedDateString = formatter.stringFromDate(currentDate)
        
        print("Today is \(cleanedDateString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

