//
//  PetViewController.swift
//  PetPics1
//
//  Created by Ben Ellingson on 11/23/15.
//  Copyright © 2015 NNM. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {

    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var petPic: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = petPic["title"] as? String
        
        if let url = petPic["url_l"] as? String {
            fetchImage(url, imageView: petImageView)
        }
                
    }
    
    
}
