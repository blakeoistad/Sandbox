//
//  DataManager.swift
//  omdbSearchTV
//
//  Created by Blake Oistad on 4/5/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {

    static let sharedInstance = DataManager()
    
    var baseURLString = "www.omdbapi.com"
    var searchString = String()
    
    
    
    func parseMovieData(data: NSData) {
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            let tempDictArray = jsonResult as! NSDictionary
            
            let flickTitle = tempDictArray.objectForKey("Title") as! String
            
            print("DM:\nFlick Title: \(flickTitle)")
            
        } catch {
            print("DM:\nJSON Parsing Error")
        }
    }

    
    
    
    
    func getDataFromServer(searchString: String) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        defer {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        let url = NSURL(string: "https://\(baseURLString)/?t=\(searchString)&y=&plot=short&r=json")
        let urlRequest = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 30.0)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in
            if data != nil {
                print("DM:\nGot Data!\n")
                self.parseMovieData(data!)
            } else {
                print("DM:\nNo Data")
            }
        }
        task.resume()
    }

}
