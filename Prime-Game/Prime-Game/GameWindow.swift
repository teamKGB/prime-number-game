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
    
    
    var timeLeft: Int = 0
    var gameLevel: Int = 0
    var blockNumbers: Int = 0;
    
    private var xOffset: CGFloat = 0.0
    private var yOffset: CGFloat = 0.0
    
    // This array keeps track of all obstacle views
    var obstacleViews : [UIView] = []
    
    var location = CGPoint(x: 50, y: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeStyle()
        
        gameStart()
        
    }
    
    func gameStart() {
        gameLevel += 1 //increment level by 1 for each level
        levelLable.text = String(gameLevel)
        
        //check how many block to produce in one level
        if(gameLevel < 3){
            
            timeLeft = 40
            while (blockNumbers < 5){
                blockNumbers = Int(arc4random_uniform(30)) + 1
            }
        }
        else if (gameLevel < 8) {
            while (blockNumbers < 10){
                blockNumbers = Int(arc4random_uniform(20)) + 1
            }
            timeLeft = 30
        }
        else {
            while (blockNumbers < 15){
                blockNumbers = Int(arc4random_uniform(30)) + 1
            }
            timeLeft = 20
        }
        
        //make blocks
        
        for(var i = 0; i < blockNumbers; i++){
            xOffset = randomBetweenNumbers(1, secondNum: gameWindowView.frame.size.width)
            yOffset = randomBetweenNumbers(1, secondNum: gameWindowView.frame.size.height)
            var newBlockView = block(frame: CGRectMake(xOffset, yOffset, 40, 40))
            
            println("this is new x:  \(newBlockView.center.x)")
            println("this is new y: \(newBlockView.center.y)")
            
            // set grid size
            var size = 40.0
            //n.frame = CGRectMake(pointX, pointY, 60, 60)
            
            // snap to the grid
            newBlockView.center = CGPointMake(CGFloat(size) * CGFloat(floor(newBlockView.center.x/CGFloat(size))), CGFloat(size) * CGFloat(floor(newBlockView.center.y/CGFloat(size))))
            
            newBlockView.center.x += 27.5
            newBlockView.center.y += 39.5
            
            if (newBlockView.center.x - 27.5 < 0) {
                newBlockView.center.x = 27.5
            }
            
            if (newBlockView.center.x + 27.5 > gameWindowView.frame.size.width) {
                newBlockView.center.x = gameWindowView.frame.size.width - 27.5
            }
            
            if (newBlockView.center.y - 20 < 19.5) {
                newBlockView.center.y = 19.5 + 20
            }
            
            if (newBlockView.center.y + 20 > gameWindowView.frame.size.height - 39.5) {
                newBlockView.center.y = gameWindowView.frame.size.height - 39.5
            }
            
            gameWindowView.addSubview(newBlockView)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
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