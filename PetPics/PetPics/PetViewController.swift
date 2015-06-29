//
//  PetViewController.swift
//  PetPics
//
//  Created by Ben Ellingson on 6/29/15.
//  Copyright (c) 2015 NNM. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {
    
    var pet: NSDictionary?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = pet?["title"] as? String
        
        petImageView.image = UIImage(named: "placeholder")
                
        if let petUrl = pet?["url_l"] as? String {
            fetchImage(petUrl, imageView: petImageView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
