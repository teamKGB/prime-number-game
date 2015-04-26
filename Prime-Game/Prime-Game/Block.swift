//
//  block.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/24/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

//this protocl will let the GameWindow class to perform action when the delegate is called
protocol BlockDelegate {
     func blockHasMoved(bl: Block)
    func blockIsMoving(bl: Block)
}

class Block: UIView {
    
    var lastLocation: CGPoint = CGPointMake(0, 0)
    // define grid size
    var size = 40.0
    var delegate : BlockDelegate?
    
    override init(frame: CGRect) {
        
        //superclass initializer
        super.init(frame: frame)
        
        //get three random background colors
        let blueC = CGFloat(Int(arc4random() % 255)) / 255.0
        let redC = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenC = CGFloat(Int(arc4random() % 255)) / 255.0
        
        //set the background color
        self.backgroundColor = UIColor(red: redC, green: greenC, blue: blueC, alpha: 1.0)
        
        //make the block draggable
        let panRec = UIPanGestureRecognizer(target: self, action: "draggedView:")
        self.addGestureRecognizer(panRec)
        
    }

    //this should never be called
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draggedView(sender:UIPanGestureRecognizer){
        
        // detect when a block is touched
        var translation  = sender.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        
        // make sure the block will be place on the grid
        self.center = CGPointMake(CGFloat(size) * CGFloat(floor(self.center.x/CGFloat(size))), CGFloat(size) * CGFloat(floor(self.center.y/CGFloat(size))))
        self.center.x += 27.5
        self.center.y += 39.5
        
        //debug
        //println("this is x:  \(self.center.x)")
        //println("this is y: \(self.center.y)")
        
        //Make sure the block will not be able to move out of the gameWindowView
        if (self.center.x + 27.5 > self.superview?.frame.size.width) {
            self.center.x = self.superview!.frame.size.width - 27.5
        }
        
        if (self.center.y - 20 < 19.5) {
            self.center.y = 19.5 + 20
        }
        
        if (self.center.y + 20 > self.superview!.frame.size.height - 39.5) {
            self.center.y = self.superview!.frame.size.height - 39.5
        }
        
        if (self.center.x - 27.5 < 0) {
            self.center.x = 27.5
        }
        
        //check if the user is dragging the view, than send a signal to the GameWindow Class
        if(sender.state == UIGestureRecognizerState.Changed) {
            if delegate == nil {
                println("Delegate is nul")
            }
            else {
                delegate!.blockIsMoving(self)
            }
        }

        //check if the dragging is done, than send a signal to the GameWindow Class
        if(sender.state == UIGestureRecognizerState.Ended) {
            //println(self)
            
            if delegate == nil {
                println("Delegate is nul")
            }
            else {
               delegate!.blockHasMoved(self)
            }
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // highlight the touched view
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        // highlight the touched view
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    
}


    
    

