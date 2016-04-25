
//
//  ListViewController.swift
//  ClassicPhotos
//
//  Created by Richard Turton on 03/07/2014.
//  Copyright (c) 2014 raywenderlich. All rights reserved.
//

import UIKit
import CoreImage

let dataSourceURL = NSURL(string:"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist")

class ListViewController: UITableViewController {
    
    var photos = [PhotoRecord]()
    let pendingOperations = PendingOperations()
    
    
    func fetchPhotoDetails() {
        let request = NSURLRequest(URL:dataSourceURL!)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {response,data,error in
            if data != nil {
                
                do {
                    let datasourceDictionary = try NSPropertyListSerialization.propertyListWithData(data!, options: NSPropertyListMutabilityOptions.Immutable, format: nil) as! NSDictionary
                    
                    for(key : AnyObject,value : AnyObject) in datasourceDictionary {
                        let name = key as? String
                        let url = NSURL(string:value as? String ?? "")
                        if name != nil && url != nil {
                            let photoRecord = PhotoRecord(name:name!, url:url!)
                            self.photos.append(photoRecord)
                        }
                    }
    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
                self.tableView.reloadData()
            }
            
            if error != nil {
                let alert = UIAlertView(title:"Oops!",message:error!.localizedDescription, delegate:nil, cancelButtonTitle:"OK")
                alert.show()
            }
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Classic Photos"
    fetchPhotoDetails()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // #pragma mark - Table view data source
  
  override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as! UITableViewCell
    
    //1
    if cell.accessoryView == nil {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        cell.accessoryView = indicator
    }
    let indicator = cell.accessoryView as! UIActivityIndicatorView
    
    //2
    let photoDetails = photos[indexPath.row]
    
    //3
    cell.textLabel?.text = photoDetails.name
    cell.imageView?.image = photoDetails.image
    
    //4
    switch (photoDetails.state) {
    case .Filtered:
        indicator.stopAnimating()
    case .Failed:
        indicator.stopAnimating()
        cell.textLabel?.text = "Failed to load"
    case .New, .Downloaded:
        indicator.startAnimating()
        self.startOperationsForPhotoRecord(photoDetails, indexPath: indexPath)
    }
    
    
    return cell
  }
  
    func startDownloadForRecord(photoDetails: PhotoRecord, indexPath: NSIndexPath) {
        //1: Check if indexPath to see if there is already an operation in downloadsInProgress, if yes then ignore it
        if let downloadOperation = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        //2: If not, create an instance of ImageDownlaoder by using the initializer
        let downloader = ImageDownloader(photoRecord: photoDetails)
        //3: Add a completion block which will be executed when the operation is completed. This is a great place to let the rest of your app know that an operation has finished. It’s important to note that the completion block is executed even if the operation is cancelled, so you must check this property before doing anything. You also have no guarantee of which thread the completion block is called on, so you need to use GCD to trigger a reload of the table view on the main thread.
        downloader.completionBlock = {
            if downloader.cancelled {
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.pendingOperations.downloadsInProgress.removeValueForKey(indexPath)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
        }
        
        //4: Add operation to downloadsInProgress to help keep track of things
        pendingOperations.downloadsInProgress[indexPath] = downloader
        
        //5: Add operation to download queue, this is what STARTS the operation, the queue takes care of scheduling once you've added the operation
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    
    func startFiltrationForRecord(photoDetails: PhotoRecord, indexPath: NSIndexPath) {
        if let filterOperation = pendingOperations.filtrationsInProgress[indexPath] {
            return
        }
        
        let filterer = ImageFiltration(photoRecord: photoDetails)
        filterer.completionBlock = {
            if filterer.cancelled {
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.pendingOperations.filtrationsInProgress.removeValueForKey(indexPath)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
        }
        pendingOperations.filtrationsInProgress[indexPath] = filterer
        pendingOperations.filtrationQueue.addOperation(filterer)
    }
    
    func startOperationsForPhotoRecord(photoDetails: PhotoRecord, indexPath: NSIndexPath) {
        switch (photoDetails.state) {
        case .New:
            startDownloadForRecord(photoDetails, indexPath: indexPath)
        case .Downloaded:
            startFiltrationForRecord(photoDetails, indexPath: indexPath)
        default:
            print("Do Nothing")
        }
    }
  
}
