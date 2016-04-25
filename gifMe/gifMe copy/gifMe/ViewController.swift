//
//  ViewController.swift
//  gifMe
//
//  Created by Blake Oistad on 4/22/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    //MARK: - Properties
    
    @IBOutlet weak var gifImageView: UIImageView!

    var selectedGif = String()
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedGif
        
        let currentGif = UIImage.gifWithName(selectedGif)!
        print("CurrentGif: \(currentGif)")
        let imageView = UIImageView(image: currentGif)
        print("ImageView: \(imageView)")
        gifImageView.image = imageView.image
        
        // Returns an animated UIImage
//        let jeremyGif = UIImage.gifWithName("dots")
        
        // Use the UIImage in your UIImageView
//        let imageView = UIImageView(image: jeremyGif)
//        gifImageView.image = imageView.image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

