//
//  ViewController.swift
//  audioTester3000
//
//  Created by Blake Oistad on 12/24/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ViewController: UIViewController {

    // MARK: - Properties
    
    let audioPlayer = AVAudioPlayer()
    
    // MARK: - Interactivity Methods
    
    @IBAction func playButtonPressed(sender: UIButton) {
        print("Play button pressed")
    }
    
    @IBAction func pauseButtonPressed(sender: UIButton) {
        print("Pause button pressed")
    }
    
    // MARK: - Life Style Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

