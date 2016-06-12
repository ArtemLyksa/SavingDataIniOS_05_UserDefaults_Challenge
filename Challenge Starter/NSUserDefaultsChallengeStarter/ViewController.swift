//
//  ViewController.swift
//  NSUserDefaultsChallengeStarter
//
//  Created by Brian on 11/25/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var totalOpenings = userDefaults.integerForKey("openings")
        totalOpenings += 1
        userDefaults.setInteger(totalOpenings, forKey: "openings")
        let alreadyRated = userDefaults.boolForKey("AlreadyRated")
        
        if !alreadyRated && totalOpenings >= 3 {
            let alertController = UIAlertController(title: "Rate Our App", message: "If you are enjoyed our app please make sure to rate it", preferredStyle: .Alert)
            let rateApp = UIAlertAction(title: "RateApp", style: .Default, handler: { (UIAlertAction) in
                userDefaults.setBool(true, forKey: "AlreadyRated")
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            let close = UIAlertAction(title: "CloseApp", style: .Default, handler: { (UIAlertAction) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(rateApp)
            alertController.addAction(close)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

