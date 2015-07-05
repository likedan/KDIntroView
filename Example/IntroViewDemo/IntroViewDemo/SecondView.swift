
//
//  SecondView.swift
//  IntroViewDemo
//
//  Created by Kedan Li on 15/7/5.
//  Copyright (c) 2015年 TakeFive Interactive. All rights reserved.
//

import UIKit
import KDIntroView

class SecondView: KDIntroView{
    
    //0 - 640
    
    @IBOutlet var words: UIView!
    @IBOutlet var redo1: UILabel!
    @IBOutlet var redo2: UILabel!
    @IBOutlet var board: UIView!
    
    @IBOutlet var choice1: UIImageView!
    @IBOutlet var choice2: UIImageView!
    @IBOutlet var choice3: UIImageView!
    @IBOutlet var choice4: UIImageView!
    @IBOutlet var choice5: UIImageView!
    @IBOutlet var choice6: UIImageView!
    @IBOutlet var choice7: UIImageView!
    @IBOutlet var choice8: UIImageView!
    @IBOutlet var choice9: UIImageView!
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        
        var enlarge = CGAffineTransformMake(20, 0, 0, 20, 0, 0)
        
        redo1.alpha = 0
        redo2.alpha = 0
        
        redo1.transform = enlarge
        redo2.transform = enlarge
        
        choice1.alpha = 0
        choice2.alpha = 0
        choice3.alpha = 0
        choice4.alpha = 0
        choice5.alpha = 0
        choice6.alpha = 0
        choice7.alpha = 0
        choice8.alpha = 0
        choice9.alpha = 0
        
        words.alpha = 0
        
        var shrinkBoard = CGAffineTransformMake(1 / 640, 0, 0, 1 / 640, -320, board.frame.height)
        board.transform = shrinkBoard
    }
    
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        
        
        if index < 160{
            var enlarge = CGAffineTransformMake(4 * index / 640, 0, 0, 4 * index / 640, -320 + index, board.frame.height - index * board.frame.height / 160)
            board.transform = enlarge
        }else if index >= 160 && index <= 320{
            var enlarge = CGAffineTransformMake(1, 0, 0, 1, -320 + index, 0)
            board.transform = enlarge
        }else if index > 320 && index < 480{
            var turnLeft = CGAffineTransformMakeRotation((index - 320) * 3.14 / 320)
            board.transform = turnLeft
            backgroundColor = UIColor.clearColor()
            
        }else if index >= 480{
            var turnLeft = CGAffineTransformMakeRotation(3.14 / 2)
            board.transform = turnLeft
        }
        
        
        if index > 160{
            choice1.alpha = (index - 160) / 10
            choice2.alpha = (index - 170) / 10
            choice3.alpha = (index - 180) / 10
            choice4.alpha = (index - 190) / 10
            choice5.alpha = (index - 200) / 10
            choice6.alpha = (index - 210) / 10
            choice7.alpha = (index - 220) / 10
            choice8.alpha = (index - 230) / 10
            choice9.alpha = (index - 240) / 10
        }else{
            choice1.alpha = 0
            choice2.alpha = 0
            choice3.alpha = 0
            choice4.alpha = 0
            choice5.alpha = 0
            choice6.alpha = 0
            choice7.alpha = 0
            choice8.alpha = 0
            choice9.alpha = 0
        }
        
        if index <= 230{
            redo1.alpha = 0
        } else if index > 230 && index < 270{
            var shrink = CGAffineTransformMake((271 - index) / 2, 0, 0, (271 - index) / 2, 0, 0)
            redo1.alpha = (index - 230) / 40
            redo1.transform = shrink
        } else if index >= 270 && index <= 320 {
            redo1.alpha = 1
            var shrink = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            redo1.transform = shrink
        }
        
        var speed1 = CGAffineTransformMakeTranslation(-(index - 320)/4, 0)
        var speed2 = CGAffineTransformMakeTranslation((index - 320)/4, 0)
        
        if index <= 260 {
            redo2.alpha = 0
        } else if index > 260 && index < 300{
            var shrink = CGAffineTransformMake((301 - index) / 2, 0, 0, (301 - index) / 2, 0, 0)
            redo2.alpha = (index - 260) / 40
            redo2.transform = shrink
        }else if index >= 300 && index <= 320 {
            redo2.alpha = 1
            var shrink = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            redo2.transform = shrink
        }else if index > 320{
            redo2.transform = speed1
        }
        
        if index < 320{
            words.alpha = index / 320
        }else{
            words.alpha =  1 - (index - 320) / 320
            words.transform = speed2
        }
        if index <= 231{
            self.superview?.backgroundColor = UIColor.clearColor()
        }else if index > 231 && index < 320{
            self.superview?.backgroundColor = UIColor(red: 32.0/255, green: 176.0/255, blue: 140.0/255, alpha: 1)
            
        }
        
    }
    
}
