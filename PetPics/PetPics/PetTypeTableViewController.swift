//
//  PetTypeTableViewController.swift
//  PetPics
//
//  Created by Ben Ellingson on 6/29/15.
//  Copyright (c) 2015 NNM. All rights reserved.
//

import UIKit

class PetTypeTableViewController: UITableViewController {
    
    let petType = [ "Cats", "Dogs", "Fish", "Birds" ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petType.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("petType", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = petType[indexPath.row]


        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "petPics" {
            
            let petPicsCtrl = segue.destinationViewController as? PetPicCollectionViewController
            let row = tableView.indexPathForSelectedRow()?.row
            petPicsCtrl?.pet = petType[row!]
            
        }
        
        
    }
    

}
