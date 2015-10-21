//
//  ViewController.swift
//  WebBrowser
//
//  Created by Ben Ellingson on 6/26/15.
//  Copyright (c) 2015 NNM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonTouched(sender: AnyObject) {
        
        loadWebView()
        
    }
    
    func loadWebView() {
        
        if let urlString = urlField.text {
        
            let url = NSURL(string: urlString)
            
            let urlRequest = NSURLRequest(URL: url!)
            
            webView.loadRequest(urlRequest)
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        loadWebView()
        
        return true
    }

}

