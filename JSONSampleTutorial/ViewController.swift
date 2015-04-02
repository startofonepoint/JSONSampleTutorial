//
//  ViewController.swift
//  JSONSampleTutorial
//
//  Created by lostin1 on 2015. 3. 31..
//  Copyright (c) 2015년 lostin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonURLString:String = "http://api.kivaws.org/v1/loans/search.json?status=fundraising"
        let jsonURL:NSURL = NSURL(string: jsonURLString)!
        let globalQueue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(globalQueue, ({
            var data:NSData = NSData(contentsOfURL: jsonURL)!
            self.fetchedData(data)
        }))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchedData(responseData:NSData) {
        var error:NSError?
        let jsonDic:NSMutableDictionary = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSMutableDictionary
        
        let key:String = "loans"
        let latestLoans = jsonDic.objectForKey(key as AnyObject)
        println("loans:\(latestLoans)")
    }
}

