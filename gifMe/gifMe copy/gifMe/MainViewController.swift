//
//  MainViewController.swift
//  gifMe
//
//  Created by Blake Oistad on 4/22/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    
    var gifManager = GifManager.sharedInstance
    
    @IBOutlet weak var gifTableView: UITableView!
    
    //MARK: - Table View Methdos
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifManager.gifTitlesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        cell?.textLabel?.text = gifManager.gifTitlesArray[indexPath.row]
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destController = segue.destinationViewController as! ViewController
        if segue.identifier == "segueToGif" {
            let indexPath = gifTableView.indexPathForSelectedRow!
            let selectedGif = gifManager.gifTitlesArray[indexPath.row]
            destController.selectedGif = selectedGif
            gifTableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
