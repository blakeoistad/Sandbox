//
//  ViewController.swift
//  musicLibraryDemo
//
//  Created by Blake Oistad on 4/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ViewController: UIViewController, MPMediaPickerControllerDelegate, AVAudioPlayerDelegate {

    //MARK: - Properties
    
    var mediaPickerController: MPMediaPickerController?
    
    let MPMediaItemPropertyTitle = String()
    
    //MARK: - Interactivity Methods
    
    @IBAction func mediaButtonPressed(sender: UIButton) {
        print("Button Pressed")
        displayMediaPickerController()
    }
    
    //MARK: - Media Picker Methods
    
    func displayMediaPickerController() {
        mediaPickerController = MPMediaPickerController(mediaTypes: .AnyAudio)
        
        if let picker = mediaPickerController {
            print("Successfully instantiated a media picker")
            picker.delegate = self
            picker.allowsPickingMultipleItems = false
            picker.showsCloudItems = false
            picker.prompt = "Please pick a song"
            view.addSubview(picker.view)
            
            presentViewController(picker, animated: true, completion: nil)
        } else {
            print("Unable to instantiate a media picker")
        }
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        let selectedItem = mediaItemCollection.items
        let itemDescription = MPMediaItemPropertyTitle
        print("Selected: \(itemDescription)")
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("Music Picker was cancelled")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Media Query Methods
    
//    MPMediaQuery *myPlaylistsQuery = [MPMediaQuery playlistsQuery];
//    NSArray *playlists = [myPlaylistsQuery collections];
//    
//    for (MPMediaPlaylist *playlist in playlists) {
//    NSLog (@"%@", [playlist valueForProperty: MPMediaPlaylistPropertyName]);
//    
//    NSArray *songs = [playlist items];
//    for (MPMediaItem *song in songs) {
//    NSString *songTitle =
//    [song valueForProperty: MPMediaItemPropertyTitle];
//    NSLog (@"\t\t%@", songTitle);
//    }
//    }
    
    
    func getSongInfo() {
        
        let myPlaylistQuery = MPMediaQuery.playlistsQuery()
        let playlistArray = [myPlaylistQuery.collections]
        print("\n\(playlistArray.count) playlists on device")
        
        let mySongQuery = MPMediaQuery.songsQuery()
        let songsArray = [mySongQuery.collections]
        print("\n\(songsArray.count) songs on device")
        
        
        for playlist in playlistArray {
            print("Playlists: )")
        }
        
//        let query = MPMediaQuery.songsQuery()
//        print("Query: \n\(query)")
//        query.groupingType = .Artist
//        var songsArray = query.collections
//        
//        let representativeItem = songsArray.representativeItem
//        let title = representativeItem.title
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSongInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

