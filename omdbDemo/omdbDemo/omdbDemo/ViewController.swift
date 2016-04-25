//
//  ViewController.swift
//  omdbDemo
//
//  Created by Blake Oistad on 3/29/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataManager = DataManager.sharedInstance
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    
    func newDataReceived() {
        print("Released: \(dataManager.releaseDateString)")
        
        titleLabel.text = dataManager.titleString
        directorLabel.text = dataManager.directorString
        releaseLabel.text = dataManager.releaseDateString
        if let url = NSURL(string: "\(dataManager.posterURLString)") {
            if let data = NSData(contentsOfURL: url) {
                posterImageView.image = UIImage(data: data)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.getDataFromServer()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "newDataReceived", name: "receivedDataFromServer", object: nil)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

