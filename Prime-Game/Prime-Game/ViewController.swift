//
//  ViewController.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/23/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goTohowToPlayButton(sender: UIButton) {
        self.performSegueWithIdentifier("goToHowToPlayPageSegue", sender: self)
    }
    
    @IBAction func goBacktoHomePageFromHowTo(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

