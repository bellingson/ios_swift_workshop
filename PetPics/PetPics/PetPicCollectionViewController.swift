//
//  PetPicCollectionViewController.swift
//  PetPics
//
//  Created by Ben Ellingson on 6/29/15.
//  Copyright (c) 2015 NNM. All rights reserved.
//

import UIKit

let reuseIdentifier = "PetCell"

class PetPicCollectionViewController: UICollectionViewController {
    
    var pet: String!
    
    var pets: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performInBackground( fetchPetData , callback: { collectionView?.reloadData() })
        
    }
    
    func fetchPetData() {
        
        println("fetch pet: \(pet)")
        
        let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=2f5b0e5d58e344d55cfb9aec4c9a89fe&text=cute+\(pet)&format=json&extras=url_s,url_l&nojsoncallback=1&per_page=10"
        
        // println("url: \(url)")
        
        let jsonData = NSData(contentsOfURL: NSURL(string: url)!)
        
        // println(NSString(data: jsonData!, encoding: NSUTF8StringEncoding))
        
        if let json = NSJSONSerialization.JSONObjectWithData(jsonData!, options: nil, error: nil) as? NSDictionary {
            
            if let photosJson = json["photos"] as? NSDictionary {
                pets = photosJson["photo"] as? [NSDictionary]
            }
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = pets?.count as Int! {
            return count
        }

        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PetCollectionViewCell
        
        let petPic = pets![indexPath.row]

        if let title = petPic["title"] as? String {
            cell.titleLabel.text = title
        }
        
        cell.petImageView.image = UIImage(named: "placeholder")
        
        if let imageUrl = petPic["url_s"] as? String {
            fetchImage(imageUrl, imageView: cell.petImageView)
        }
        
        return cell
    }
    
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "petView" {
            
            let petViewCtrl = segue.destinationViewController as? PetViewController
            let row = collectionView?.indexPathsForSelectedItems()[0].row
            petViewCtrl?.pet = pets?[row!]
            
        }
        
    }
    

}
