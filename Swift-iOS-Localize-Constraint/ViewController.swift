//
//  ViewController.swift
//  Swift_iOS-Localize-Constraint
//
//  Created by binaryboy on 10/9/15.
//  Copyright (c) 2015 AhmedHamdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.changeViewRTL(self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func localizeConstraint(sender: AnyObject) {
        for  tempView:UIView in self.view.allSubViews() {
            
            self.changeViewRTL(tempView)
        }
    }

}

