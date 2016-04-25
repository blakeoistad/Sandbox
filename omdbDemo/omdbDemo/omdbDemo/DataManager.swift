//
//  DataManager.swift
//  omdbDemo
//
//  Created by Blake Oistad on 3/29/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    static let sharedInstance = DataManager()
    
    var baseURLString = "www.omdbapi.com"
    var searchString = "rent"
    var titleString: String!
    var actorString: String!
    var directorString: String!
    var releaseDateString: String!
    var posterURLString: String!
    
    func parseMovieData(data: NSData) {
        do {
            print("1")
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            print("2")
            let tempDictArray = jsonResult as! NSDictionary
            print("3")
            print(tempDictArray)
            actorString = tempDictArray.objectForKey("Actors") as! String
            print(actorString)
            directorString = tempDictArray.objectForKey("Director") as! String
            releaseDateString = tempDictArray.objectForKey("Released") as! String
            titleString = tempDictArray.objectForKey("Title") as! String
            posterURLString = tempDictArray.objectForKey("Poster") as! String
            
            print("\(titleString) is directed by \(directorString) and was released on \(releaseDateString)")
            print("Poster URL is \(posterURLString)")
            
            dispatch_async(dispatch_get_main_queue()) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "receivedDataFromServer", object: nil))
            }

            
        } catch {
            print("JSON Parsing Error")
        }
    }
    
    func getDataFromServer() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        defer {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        let url = NSURL(string: "https://\(baseURLString)/?t=\(searchString)&y=&plot=short&r=json")
        let urlRequest = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 30.0)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in
            if data != nil {
                print("Got Data!")
                self.parseMovieData(data!)
            } else {
                print("No Data")
            }
        }
        task.resume()
    }
}


