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
    
    //MARK: - Interactivity Methods
    
    @IBAction func toggleFill(sender: UIBarButtonItem) {
        print("Toggle Fill Pressed")
        
        gifImageView.contentMode = .ScaleToFill
    }
    
    @IBAction func toggleZoom(sender: UIBarButtonItem) {
        print("Toggle Zoom Pressed")
        
        gifImageView.contentMode = .ScaleAspectFill
    }
    
    @IBAction func toggleFit(sender: UIBarButtonItem) {
        print("Toggle Fit Pressed")
        
        gifImageView.contentMode = .ScaleAspectFit
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touched")
        navigationController?.navigationBarHidden = !(navigationController?.navigationBarHidden)!
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedGif
        
        navigationController?.navigationBarHidden = true
        
        
        let currentGif = UIImage.gifWithName(selectedGif)!
        let imageView = UIImageView(image: currentGif)
        gifImageView.image = imageView.image
        
        //MARK: - Set Background Color for Black-Heavy Images
        
        if selectedGif == "sharkFin" || selectedGif == "cpu" || selectedGif == "zoomDown" || selectedGif == "barWaves" || selectedGif == "endlessDNA" || selectedGif == "slinkies" || selectedGif == "downwardSpiral" || selectedGif == "rainbowSnake" || selectedGif == "machine" || selectedGif == "spiralColumn" || selectedGif == "spiralingDown" || selectedGif == "floatingCubes" || selectedGif == "lightTunnel" || selectedGif == "suckedIn" || selectedGif == "swirlTunnel" || selectedGif == "impossible" || selectedGif == "powerSphere" {
            self.view.backgroundColor = UIColor.blackColor()
        }
        
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

