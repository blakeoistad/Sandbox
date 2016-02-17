//
//  ViewController.swift
//  streamingAudioTest
//
//  Created by Blake Oistad on 12/5/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, NSXMLParserDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var trackProgressSlider: UISlider!
    @IBOutlet weak var trackTimePassedLabel: UILabel!
    @IBOutlet weak var trackTimeRemainingLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var mpVolumeSlider: MPVolumeView!
    
    var trackURL = NSURL(string: "http://www.largesound.com/ashborytour/sound/brobob.mp3")
    var audioPlayer = AVPlayer()
    var audioDurationSeconds : Double!
    var currentTimeInTrack = Float64()

    //MARK: - Streaming Methods
    
    
    func updateTrackProgress(time: CMTime) {
        let currentTimeInSeconds = CMTimeGetSeconds(time)
        currentTimeInTrack = Float64(currentTimeInSeconds)
        let progress = Int(currentTimeInSeconds / audioDurationSeconds)
        print("Time: \(currentTimeInSeconds) duration: \(audioDurationSeconds) progress: %\(Float(progress) * 100)")
//        trackProgressSlider.setValue(Float(progress), animated: true)
//        trackTimeRemainingLabel.text = String(format: "%.2f", (audioDurationSeconds - currentTimeInSeconds))
        trackTimePassedLabel.text = String(format: "%.2f", currentTimeInSeconds)
    }

    @IBAction func seekToTime(sender: UISlider) {
        print("Current Value: \(trackProgressSlider.value)")
        let sliderValueInCMTime = CMTimeMake(Int64(trackProgressSlider.value), 1)
//        audioPlayer.seekToTime(sliderValueInCMTime)
        audioPlayer.seekToTime(sliderValueInCMTime, toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero) { (finished) -> Void in
            if (finished) {
                self.updateTrackProgress(sliderValueInCMTime)
            }
        }
//        updateTrackProgress(sliderValueInCMTime)
    }
    
    @IBAction func playPauseButtonPressed(sender: UIButton) {
        
        if playPauseButton.titleLabel!.text == "Play" {
            playPauseButton.setTitle("Pause", forState: .Normal)
            audioPlayer.play()
        } else {
            playPauseButton.setTitle("Play", forState: .Normal)
            audioPlayer.pause()
        }
    }
    
//    @IBAction func volumeSliderChanged(sender: UISlider) {
//        print("Value: \(volumeSlider.value)")
//            audioPlayer.volume = volumeSlider.value
//    }

    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Track Duration in Seconds as Double
        let asset = AVURLAsset(URL: trackURL!)
        audioDurationSeconds = (CMTimeGetSeconds(asset.duration))
        
        //Instantiate player and load current item
        let playerItem = AVPlayerItem(URL: trackURL!)
        audioPlayer = AVPlayer(playerItem: playerItem)
        audioPlayer.allowsExternalPlayback = true
        audioPlayer.addPeriodicTimeObserverForInterval(CMTime(seconds: 0.1, preferredTimescale: 10), queue: dispatch_get_main_queue()) { (time) -> Void in
            self.trackProgressSlider.setValue(Float(self.currentTimeInTrack), animated: true)
            self.updateTrackProgress(time)
        }
        
        trackProgressSlider.setThumbImage(UIImage(named: "sliderThumb"), forState: .Normal)
        trackProgressSlider.maximumValue = Float(audioDurationSeconds)

        
        //Start audio session
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

