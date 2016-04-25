//
//  ViewController.swift
//  alertActions
//
//  Created by Blake Oistad on 4/9/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var alertButton: UIButton!
    
    
    //MARK: - Interactivity Methods
    
    @IBAction func alertButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "ALERT!", message: "If you're seeing this alert popup, your alert is working!", preferredStyle: .Alert)
        let confirmAction = UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
            print("User pressed OK")
        })
        let denyAction = UIAlertAction(title: "Cancel", style: .Default, handler: { (action) -> Void in
            print("User pressed Cancel")
        })
        let randomAction = UIAlertAction(title: "Random", style: .Default, handler: { (action) -> Void in
            print("User pressed Random")
        })
        alert.addAction(confirmAction)
        alert.addAction(denyAction)
        alert.addAction(randomAction)
        self.presentViewController(alert, animated: true) {
        }

    }
    
    
    
    
    //MARK: - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

