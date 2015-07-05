//
//  ThirdView.swift
//  IntroViewDemo
//
//  Created by Kedan Li on 15/7/5.
//  Copyright (c) 2015年 TakeFive Interactive. All rights reserved.
//

import UIKit
import KDIntroView

class ThirdView: KDIntroView {
    
    @IBOutlet var lab1: UILabel!
    
    @IBOutlet var vertical: UIImageView!
    @IBOutlet var horizontal: UIImageView!
    
    @IBOutlet var portrait: UILabel!
    @IBOutlet var landscape: UILabel!
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    //0 - 640
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var turn = CGAffineTransformMake(1 - (index - 250) / 70, (index - 250) / 70 - (index - 250) / 210, -(index - 250) / 70 + (index - 250) / 210, 1 - (index - 250) / 70, (index - 250), (index - 250) * 2.0)
        var transform = CGAffineTransformMake(1 - (index - 250) / 210, 0, 0, 1 - (index - 250) / 210, -(index - 250) / 2, -(index - 250) / 3)
        
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        if index < 100{
            self.superview?.backgroundColor = UIColor(red: 32.0/255, green: 176.0/255, blue: 140.0/255, alpha: 1)
        }else if index > 100 && index < 200{
            self.superview?.backgroundColor = UIColor(red: (32.0 + (index - 100) * 1.11)/255, green: (176.0 + (index - 100) * 0.29)/255, blue: (140.0 + (index - 100) * 0.67)/255, alpha: 1)
        }else if index >= 200{
            self.superview?.backgroundColor = UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1)
        }
        
        if index < 200{
            vertical.alpha = 0
            horizontal.alpha = 1
            vertical.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            horizontal.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
        }else if index > 250 && index <= 320 {
            vertical.transform = turn
            vertical.alpha = (index - 250) / 70
            horizontal.transform = transform
            portrait.alpha = (index - 250) / 70
            landscape.alpha = (index - 250) / 70
            
        }else if index > 320{
            vertical.transform = CGAffineTransformMake(0, 0.6777777, -0.6777777, 0, 70, 140 + -(index - 320) * (index - 320) / 30)
            horizontal.transform = CGAffineTransformMake(0.6777777, 0, 0, 0.6777777, -35, -23.333 + (index - 320) * (index - 320) / 20)
            
            vertical.alpha =  1 - (index - 320) / 100
            horizontal.alpha = 1 - (index - 320) / 100
            portrait.alpha = 1 - (index - 320) / 100
            landscape.alpha = 1 - (index - 320) / 100
        }
        
        if index <= 280{
            lab1.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            lab1.alpha = 1
        }else if index > 280 && index < 320{
            lab1.transform = CGAffineTransformMake(1 + (index - 280) / 100, 0, 0, 1 + (index - 280) / 100, 0, index - 280)
            lab1.alpha = 1
        }else if index >= 320 {
            lab1.transform = CGAffineTransformMake(1.4 - (index - 320) / 70, 0, 0, 1.4 - (index - 320) / 70, -(index - 320) * 3, 40 + (index - 320) * (index - 320) / 20)
            lab1.alpha = (420 - index) / 100
        }
        
        println(index)
        
    }
    
}

