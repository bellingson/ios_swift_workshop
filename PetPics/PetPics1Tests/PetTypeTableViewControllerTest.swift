//
//  PetTypeTableViewControllerTest.swift
//  PetPics1
//
//  Created by Ben Ellingson on 11/23/15.
//  Copyright © 2015 NNM. All rights reserved.
//

import UIKit
import XCTest

/*
1) add application classes and storyboard to the test target
2) set the "PetTypeVC" identifier on the PetTypeTableViewController in the storyboard
*/

class PetTypeTableViewControllerTest: XCTestCase {
    
    var controller: PetTypeTableViewController!
    
    override func setUp() {
        super.setUp()
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        
        controller = storyboard.instantiateViewControllerWithIdentifier("PetTypeVC") as? PetTypeTableViewController
        controller.loadView()
        
    }
    
    func testViewDidLoad() {
        
        let petType: [String] = controller.petTypes
        
        XCTAssertTrue(petType.count > 0, "Pet Types Initialized")
        
        XCTAssertTrue(controller.numberOfSectionsInTableView(controller.tableView) == 1, "One Section")
        
        XCTAssertTrue(controller.tableView(controller.tableView, numberOfRowsInSection: 0) == petType.count, "Number of rows matches pet type count")
        
    }
    
    func testCellForRowAtIndexPath() {
        
        
        let cell = controller.tableView(controller.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertTrue(cell.textLabel?.text == controller.petTypes[0], "pet type label is correct")
        
        
    }
    
}
