//
//  ViewController.swift
//  omdbSearchTV
//
//  Created by Blake Oistad on 4/5/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    
    var dataManager = DataManager.sharedInstance
    var tableData = ["Jurassic Park","Jackie Brown","Back to the Future"]
    var filteredTableData = [String]()
    var resultsSearchController = UISearchController()
    @IBOutlet weak var searchTableView: UITableView!
    
    //MARK: - Table View Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if resultsSearchController.active {
            return filteredTableData.count
        } else {
            return tableData.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        if resultsSearchController.active {
            cell!.textLabel!.text = filteredTableData[indexPath.row]
            return cell!
        } else {
            cell!.textLabel!.text = tableData[indexPath.row]
            return cell!
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
            dataManager.getDataFromServer(String(searchPredicate))
            let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [String]
            searchTableView.reloadData()
        
    }
    
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsSearchController.searchBar.text = "Cube"
        
        self.resultsSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = true
            controller.searchBar.sizeToFit()
            
            searchTableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        searchTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

