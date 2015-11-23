//
//  PetCollectionViewController.swift
//  PetPics1
//
//  Created by Ben Ellingson on 11/23/15.
//  Copyright © 2015 NNM. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PetCell"

class PetCollectionViewController: UICollectionViewController {
    
    var petType: String!

    var petPics: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = petType

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        fetchData()
        
    }
    
    func fetchData() {
        
        let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=61b3012fc7b202e5584b76dc329511d3&text=cute+\(petType)&format=json&extras=url_s,url_l&nojsoncallback=1&per_page=10"
        
        guard let data = NSData(contentsOfURL: NSURL(string: url)!) else {
            print("failed to fetch data from flickr...")
            return
        }
        
        //let string = String(data: data, encoding: NSUTF8StringEncoding)
        //print(string!)
        
        do {
            
            let result: NSDictionary?
            try result = NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
            if let _result = result {
                if let photos = _result["photos"] {
                    petPics = photos["photo"] as? [NSDictionary]
                }
            }
            
        } catch let err as NSError {
            print("error parsing json: \(err.localizedDescription)")
        }

        
        //print(petPics)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        if petPics == nil {
            return 0
        }
        
        return petPics!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PetCollectionViewCell
    
        // Configure the cell
        
        guard let _petPics = petPics else {
            return cell
        }
        
        let petPic = _petPics[indexPath.row]
        
        if let url = petPic["url_s"] as? String {
            
            if let imgData = NSData(contentsOfURL: NSURL(string: url)!) {
                let image = UIImage(data: imgData)
                cell.petImageView.image = image
            }
            
        }
            
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
