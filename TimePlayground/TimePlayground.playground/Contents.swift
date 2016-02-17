//: Playground - noun: a place where people can play

import UIKit
import AVFoundation

var trackURL = NSURL(string: "http://traffic.libsyn.com/joeroganexp/p719.mp3")

let asset = AVURLAsset(URL: trackURL!)
var unfilteredDuration = asset.duration
print("Unfiltered Duration: \(unfilteredDuration)")

let filteredDurationInSeconds = Int(CMTimeGetSeconds(asset.duration))
//let roundedDurationInSeconds = String(format: "%.f", filteredDurationInSeconds)

// Need time in format: hh:mm:ss

let seconds = (filteredDurationInSeconds % 60)
let minutes = (filteredDurationInSeconds / 60) % 60
let hours = (filteredDurationInSeconds / 3600)

let durationString = String(format: "%.d : %.02d : %.02d", hours, minutes, seconds)
