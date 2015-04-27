//
//  GameWindow.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/23/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit
import Foundation

class GameWindow: UIViewController, BlockDelegate {
    

    @IBOutlet weak var titleBar: UINavigationBar!
    @IBOutlet weak var levelLable: UILabel!
    @IBOutlet weak var timeLeftLable: UILabel!
    @IBOutlet weak var gameWindowView: UIView!
    @IBOutlet weak var isPrimeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel?
    
    
    var timeLeft: Int = 0
    var gameLevel: Int = 0
    var gameScore: Int = 0
    var blockNumbers: Int = 0
    var blocks: [Block] = []
    var isPrime = false

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeStyle()
        gameStart()
        
    }

    func gameStart() {
        gameLevel += 1 //increment level by 1 for each level
        levelLable?.text = String(gameLevel)
        
        //check how many block to produce in one level
        if(gameLevel <= 3) {
            timeLeft = 25
            while (blockNumbers < 5) {
                blockNumbers = Int(arc4random_uniform(10)) + 1
            }
        }
        else if (gameLevel <= 7) {
            while (blockNumbers < 10) {
                blockNumbers = Int(arc4random_uniform(20)) + 1
            }
            timeLeft = 20
        }
        else {
            while (blockNumbers <= 13) {
                blockNumbers = Int(arc4random_uniform(30)) + 1
            }
            timeLeft = 15
        }
        
        timer()
        
        //make blocks
        var isDifferent = false
        var isFirst = true
        var check = false
        var xOffset = CGFloat(0.0)
        var yOffset = CGFloat(0.0)
        var newBlockView = Block(frame: CGRectMake(xOffset, yOffset, 40, 40))
        
        for(var i = 0; i < blockNumbers; i++){
            isDifferent = false
            check = false
            
            while isDifferent == false {
                
            //get random x and y locations
            xOffset = CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(1 - gameWindowView.frame.size.width) + min(1, gameWindowView.frame.size.width)
            yOffset = CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(1 - gameWindowView.frame.size.height) + min(1, gameWindowView.frame.size.height)
                
            
            newBlockView = Block(frame: CGRectMake(xOffset, yOffset, 40, 40))
            
            // set grid size
            var size = 40.0
            
            // make sure the block will be place on the grid
            newBlockView.center = CGPointMake(CGFloat(size) * CGFloat(floor(newBlockView.center.x/CGFloat(size))), CGFloat(size) * CGFloat(floor(newBlockView.center.y/CGFloat(size))))
            
            newBlockView.center.x += 27.5
            newBlockView.center.y += 39.5
            
                //Make sure the block will not be able to move out of the gameWindowView
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
            
                //Make sure the blocks will not be on top of each other blocks
                if isFirst != true { //check if the firs block has been created
                    
                    for b in blocks {
                        if b.center.x == newBlockView.center.x && b.center.y == newBlockView.center.y {
                            //repeat the loop
                            check = true
                            break
                        }
                        else {
                            check = false
                        }
                    }
                    
                    if(check == false){
                        isDifferent = true
                    }
                    
                    
                }
                else {
                    isDifferent = true
                }
                
            }
            newBlockView.delegate = self
            blocks.append(newBlockView)
            gameWindowView.addSubview(newBlockView)
            isFirst = false
        }
        
        //debug
        println("Total blocks: ")
        println(blocks.count)
        
    }
    
    //do something when the user clicks the "It's Prime" button
    func primeButton() {
        if isPrimNum(blockNumbers) {
            //go to next level
            println("it is prime")
            incrementScore()
            nextLevel()
        }
        else {
            //game over
            println("Game Over")
            gameOver()
        }
    }
    
    func gameOver() {
        //go to game over page
       self.performSegueWithIdentifier("goToGameOverPage", sender: self)
    }
    
    func nextLevel() {
        
        //reset all vars for currect level
        for view in gameWindowView.subviews {
            view.removeFromSuperview()
        }
        
        blocks.removeAll(keepCapacity: false)
        blockNumbers = 0
        
        //start a new level
        gameStart()
    }
    
    //detect collison function
    func blockIsMoving(bl: Block) {
        
        for block in blocks {
            if(bl != block) {
                if bl.center.x == block.center.x && bl.center.y == block.center.y {
                     println("overLapping")
                    //do something here to prevent overlapping
                    
                }
            }
        }
    }
    
    //check for finding a valid rearrangement such that the sides of the rectangle provide a factoring of the number
    func blockHasMoved(bl: Block){
        
        var countForHor = 0
        var countForVer = 0
        var h = 0
        var v = 0
        var won = true
    
        for blockOne in blocks {
            
            h = 0
            v = 0
            
            for blockTwo in blocks {
             
                if (blockOne != blockTwo) {
                    if (blockOne.center.x == blockTwo.center.x) {
                        v++
                    }
                    if (blockOne.center.y == blockTwo.center.y) {
                        h++
                    }
                }
            }
            
            if countForHor == 0 && countForVer == 0 {
                countForHor = h
                countForVer = v
            }
            
            if (h < 1 || v < 1 || h != countForHor || v != countForVer) {
                //not winning the game
                won = false
            }
            
        }
        
        if won {
            nextLevel()
        }
        
}
    
    
    
    
    
    /*
    *
    *       Helper functions
    *
    *
    */
    
    func incrementScore() {
        gameScore += 100
        self.scoreLabel?.text = String(gameScore)
    }
    
    
    
    //this will send the score to the gameOverView which is controled by ViewController.swift
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Create a variable that you want to send
        var newGameScoreVar = gameScore
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destinationViewController as! ViewController
        destinationVC.gameScore = newGameScoreVar
    }
    
    func changeStyle() {
    
        //change the title bar and tool bar color to white
        self.titleBar!.barTintColor = UIColor.whiteColor()
        
        //set the is prime button action
        self.isPrimeButton!.addTarget(self, action: "primeButton", forControlEvents: UIControlEvents.TouchUpInside)
       
    }
    
    func timer() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateTimeLabel"), userInfo: nil, repeats: true)
    }
    
    func updateTimeLabel() {
        timeLeft -= 1
        if (timeLeft < 10) {
            timeLeftLable?.text = "00:0\(String(timeLeft))"
        }
        else {
            timeLeftLable?.text = "00:\(String(timeLeft))"
        }
        if(timeLeft < 6) {
            timeLeftLable?.textColor = UIColor.redColor()
        }
        
        if(timeLeft == 0) {
            gameOver()
        }
    }
    
    func isPrimNum (number: Int) -> Bool {
        for(var i = 2; i < number - 1; i++) {
            if(number % i == 0) {
                return false
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

