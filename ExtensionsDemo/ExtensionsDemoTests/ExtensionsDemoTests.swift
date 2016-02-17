//
//  ExtensionsDemoTests.swift
//  ExtensionsDemoTests
//
//  Created by Kevin McNeish on 10/5/14.
//  Copyright (c) 2014 Oak Leaf Enterprises, Inc. All rights reserved.
//

import UIKit
import XCTest

class ExtensionsDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSubscripts() {
        
        let s = "The quick brown fox jumped over the lazy gray dog"
        print(s[0...2])
        print(s[4])
    }
    
    func testExtension() {
        
        let s = "The quick brown fox jumped over the lazy gray dog"
    }

    func testImageExtension() {
     
        let image = UIImage()
        var halfImage = image.halfSizeImage
    }
    
}
