//
//  ViewController.swift
//  searchFilterTest
//
//  Created by Blake Oistad on 12/3/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    //Properties
    
    @IBOutlet weak var candiesTableView: UITableView!
    @IBOutlet weak var candiesSearchBar: UISearchBar!
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    
    //Table View Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.candies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let currentCandy = self.candies[indexPath.row]
        
        cell.textLabel!.text = currentCandy.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filteredCandies = self.candies.filter({( candy: Candy) -> Bool in
            let stringMatch = candy.name.rangeOfString(searchText)
            return stringMatch != nil
        })
    }
    
    
    
    
    //Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add data for candy array 
        self.candies = [Candy(category:"Chocolate", name:"chocolate bar"),
            Candy(category:"Chocolate", name:"chocolate bar"),
        Candy(category:"Chocolate", name:"chocolate chip"),
        Candy(category:"Chocolate", name:"dark chocolate"),
        Candy(category:"Hard", name:"lollipop"),
        Candy(category:"Hard", name:"candy cane"),
        Candy(category:"Hard", name:"jaw breaker"),
        Candy(category:"Other", name:"caramel"),
        Candy(category:"Other", name:"sour chew"),
        Candy(category:"Other", name:"gummi bear")]
        
        candiesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
