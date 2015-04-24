//
//  GameWindow.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/23/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

class GameWindow: UIViewController {
    

    @IBOutlet weak var titleBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var levelLable: UILabel!
    @IBOutlet weak var timeLeftLable: UILabel!
    
    
    var timeLeft: Int!
    var gameLevel: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        changeStyle() 
        //addBlock()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeStyle() {
    
        //change the title bar and tool bar color to white
        titleBar.barTintColor = UIColor.whiteColor()
        toolBar.barTintColor = UIColor.whiteColor()
    }
    
    func addBlock() {
        var block = UIView(frame: CGRectMake(20, 20, 40, 40))
        block.backgroundColor = UIColor.redColor()
        self.view.addSubview(block)
    }
    
    func makeGrid(){
        
    }
    
}