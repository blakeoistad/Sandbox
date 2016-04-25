//: Playground - noun: a place where people can play

import UIKit

func addPlayer(_name: String, _team: String, _position: String, _stats: NSDictionary){
    
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    let entity = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedContext)
    
    let player = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
    
    player.setValue(_name, forKey: "name")
    player.setValue(_position, forKey: "position")
    player.setValue(_team, forKey: "teamAbbr")
    
    player.setValue(player.calculateTradeValue() as! Player, forKey: "tradeValue")