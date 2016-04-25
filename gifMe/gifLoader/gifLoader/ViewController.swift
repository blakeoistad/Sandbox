//
//  ViewController.swift
//  gifLoader
//
//  Created by Blake Oistad on 4/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let currentGif = UIImage.gifWithURL("http://trip-out.weebly.com/uploads/1/5/7/7/15779904/3756913_orig.gif")
        let imageView = UIImageView(image: currentGif)
        gifImageView.image = imageView.image
        

//        let currentGif = UIImage.gifWithName("swirlColumn2")!
//        let imageView = UIImageView(image: currentGif)
//        gifImageView.image = imageView.image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

