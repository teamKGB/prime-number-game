//
//  ViewController.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/23/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    @IBAction func goBacktoHomePageFromHowTo(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        //set the two buttons to be curved
        //makeButtonsCurve()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeButtonsCurve() {
        startButton.layer.cornerRadius = 5
        howToPlayButton.layer.cornerRadius = 5
    }


}

