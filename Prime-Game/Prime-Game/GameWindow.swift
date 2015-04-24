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
    
    // This array keeps track of all obstacle views
    var obstacleViews : [UIView] = []
    
    var location = CGPoint(x: 50, y: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        changeStyle() 
        makeBlock()
        
        obstacleViews.first?.center = CGPointMake(100, 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch = touches.first as! UITouch
        
        location = touch.locationInView(self.view)
        
        obstacleViews.first?.center = location
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch = touches.first as! UITouch
        
        location = touch.locationInView(self.view)
        
        obstacleViews.first?.center = location
    }
    
    func changeStyle() {
    
        //change the title bar and tool bar color to white
        titleBar.barTintColor = UIColor.whiteColor()
        toolBar.barTintColor = UIColor.whiteColor()
    }
    
    func makeBlock() {
        var block = UIView(frame: CGRectMake(20, 20, 40, 40))
        block.backgroundColor = UIColor.redColor()
        self.view.addSubview(block)
        
        //add the block to array
        obstacleViews.append(block)
    }
    
    func makeGrid(){
        
    }
    
    func testTouches(touches: NSSet!) {
        // Get the first touch and its location in this view controller's view coordinate system
        let touch = touches.allObjects[0] as! UITouch
        let touchLocation = touch.locationInView(self.view)
        
        for obstacleView in obstacleViews {
            // Convert the location of the obstacle view to this view controller's view coordinate system
            let obstacleViewFrame = self.view.convertRect(obstacleView.frame, fromView: obstacleView.superview)
            
            // Check if the touch is inside the obstacle view
            if CGRectContainsPoint(obstacleViewFrame, touchLocation) {
                println("Game over!")
            }
        }
    }
    
    
    
}