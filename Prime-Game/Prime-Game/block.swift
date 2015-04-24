//
//  block.swift
//  Prime-Game
//
//  Created by Ho Ting Jimmy Yeung on 4/24/15.
//  Copyright (c) 2015 TeamKGB. All rights reserved.
//

import UIKit

class block: UIView{
    
    var lastLocation: CGPoint = CGPointMake(0, 0)
    
    override init(frame: CGRect) {
        
        //superclass initializer
        super.init(frame: frame)
        
        //make the block draggable
        let panRec = UIPanGestureRecognizer(target: self, action: "draggedView:")
        self.addGestureRecognizer(panRec)
        
        
        //get three random background colors
        let blueC = CGFloat(Int(arc4random() % 255)) / 255.0
        let redC = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenC = CGFloat(Int(arc4random() % 255)) / 255.0
        
        //set the background color
        self.backgroundColor = UIColor(red: redC, green: greenC, blue: blueC, alpha: 1.0)
    }

    //this should never be called
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draggedView(sender:UIPanGestureRecognizer){
        
        // detect when a tile view is panned
        var translation  = sender.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        
        // define grid size
        var size = 40.0
        
        
        // snap to grid
        self.center = CGPointMake(CGFloat(size) * CGFloat(floor(self.center.x/CGFloat(size))), CGFloat(size) * CGFloat(floor(self.center.y/CGFloat(size))))
        self.center.x += 27.5
        self.center.y += 39.5
        
        println("this is x:  \(self.center.x)")
        println("this is y: \(self.center.y)")
        
        if (self.center.x - 27.5 < 0) {
            self.center.x = 27.5
        }
        
        if (self.center.x + 27.5 > self.superview?.frame.size.width) {
            self.center.x = self.superview!.frame.size.width - 27.5
        }
        
        if (self.center.y - 20 < 19.5) {
            self.center.y = 19.5 + 20
        }
        
        if (self.center.y + 20 > self.superview!.frame.size.height - 39.5) {
            self.center.y = self.superview!.frame.size.height - 39.5
        }

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // highlight the touched view
        self.superview?.bringSubviewToFront(self)
        
        // get starting location
        lastLocation = self.center
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        // highlight the touched view
        self.superview?.bringSubviewToFront(self)
        
        // get starting location
        lastLocation = self.center
        
    }
}


    
    

