//
//  UIViewController+Background.swift
//  PetPics1
//
//  Created by Ben Ellingson on 11/23/15.
//  Copyright © 2015 NNM. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func fetchImage(url: String, imageView: UIImageView) {
        
        var imageData: NSData?
        
        func loadImage() {
            imageData = NSData(contentsOfURL: NSURL(string: url)!)
        }
        
        performInBackground(loadImage) {
            
            if let _data = imageData {
                imageView.image = UIImage(data: _data)
            }
            
        }
        
    }
    
    func performInBackground(task: () -> (), callback: ()->()) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            task()
            dispatch_async(dispatch_get_main_queue(), callback)
        }
        
    }
    
    

    
}