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
    
    @IBOutlet weak var gameWindowView: UIView!
    
    
    var timeLeft: Int!
    var gameLevel: Int!
    
    private var xOffset: CGFloat = 0.0
    private var yOffset: CGFloat = 0.0
    
    // This array keeps track of all obstacle views
    var obstacleViews : [UIView] = []
    
    var location = CGPoint(x: 50, y: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        changeStyle() 
        //makeBlock(5)
        var newView = block(frame: CGRectMake(5, 7, 60, 60))
        gameWindowView.addSubview(newView)
        
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
    
    func isPrimNum (number: Int) -> Bool {
        
        for(var i = 2; i < number - 1; i++) {
            
            if(number % i == 0) {
            
                return false
            }
        }
        
        return true
    }
    
}