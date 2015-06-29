//
//  UIViewController+Background.swift
//  PetPics
//
//  Created by Ben Ellingson on 6/29/15.
//  Copyright (c) 2015 NNM. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func fetchImage(url: String, imageView: UIImageView) {
        
        var imageData: NSData?
        performInBackground({
                imageData = NSData(contentsOfURL: NSURL(string: url)!)
            }, callback: {
                if let data = imageData {
                    imageView.image = UIImage(data: data)
                }
        })
        
        
    }
    
    
    func performInBackground(task: () -> (), callback: ()->()) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            task()
            dispatch_async(dispatch_get_main_queue(), callback)
        }
        
    }
    
    
}
