//
//  MainViewController.swift
//  gifMe
//
//  Created by Blake Oistad on 4/22/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //MARK: - Properties
    
    var gifManager = GifManager.sharedInstance
    
    @IBOutlet weak var gifTableView: UITableView!
    
    @IBOutlet weak var gifCollectionView: UICollectionView!
    
    //MARK: - Collection View Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifManager.gifTitlesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! GifCollectionViewCell
        
        cell.gifImageView.image = UIImage(named: gifManager.gifTitlesArray[indexPath.row])
        cell.gifTitleLabel.text = gifManager.gifTitlesArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(120, 160)
    }
    
    //MARK: - Table View Methdos
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return gifManager.gifTitlesArray.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! GifTableViewCell
//        
//        cell.gifTitleLabel.text = gifManager.gifTitlesArray[indexPath.row]
//        cell.gifImageView.image = UIImage(named: gifManager.gifTitlesArray[indexPath.row])
//        cell.accessoryType = .DisclosureIndicator
//        
//        return cell
//    }
//    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destController = segue.destinationViewController as! ViewController
        if segue.identifier == "segueToGif" {
            let indexPath = gifCollectionView.indexPathsForSelectedItems()?.first
            let selectedGif = gifManager.gifTitlesArray[indexPath!.row]
            destController.selectedGif = selectedGif
            gifCollectionView.deselectItemAtIndexPath(indexPath!, animated: true)
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
