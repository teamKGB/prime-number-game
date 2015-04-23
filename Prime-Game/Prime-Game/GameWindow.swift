//
//  GameWindow.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/23/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

class GameWindow: UIViewController {
    
    var timeLeft: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addBlock()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBlock() {
        var block = UIView(frame: CGRectMake(20, 20, 40, 40))
        block.backgroundColor = UIColor.redColor()
        self.view.addSubview(block)
    }
    
}