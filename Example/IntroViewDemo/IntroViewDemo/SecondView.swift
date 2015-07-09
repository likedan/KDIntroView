
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
    
    //index : 0 ~ 2 * view.frame.width
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        if index < frame.width / 2{
            //movement of the board
            var enlarge = CGAffineTransformMake(4 * index / (frame.width * 2), 0, 0, 4 * index / (frame.width * 2), -frame.width + index, board.frame.height - index * board.frame.height / (frame.width / 2))
            board.transform = enlarge
        }else if index >= frame.width / 2 && index <= frame.width{
            var enlarge = CGAffineTransformMake(1, 0, 0, 1, -320 + index, 0)
            board.transform = enlarge
        }else if index > frame.width && index < frame.width * 1.5{
            
            var turnLeft = CGAffineTransformMakeRotation((index - 320) * 3.14 / 320)
            board.transform = turnLeft
            
        }else if index >= frame.width * 1.5{
            var turnLeft = CGAffineTransformMakeRotation(3.14 / 2)
            board.transform = turnLeft
        }
        
        
        if index > frame.width / 2 {
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
        
        if index <= 0.75 * frame.width {
            redo1.alpha = 0
        } else if index > 0.75 * frame.width && index < 0.9 * frame.width{
            var shrink = CGAffineTransformMake((0.9 * frame.width - index) / 2, 0, 0, (0.9 * frame.width - index) / 2, 0, 0)
            redo1.alpha = (index - 0.75 * frame.width) / 40
            redo1.transform = shrink
        } else if index >= 0.9 * frame.width && index <= frame.width {
            redo1.alpha = 1
            var shrink = CGAffineTransformMake(1, 0, 0, 1, 0, 0)
            redo1.transform = shrink
        }
        
        var speed1 = CGAffineTransformMakeTranslation(-(index - frame.width)/4, 0)
        var speed2 = CGAffineTransformMakeTranslation((index - frame.width)/4, 0)
        
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
        
        
//        UIColor(red: 28, green: 187, blue: 157, alpha: 1)
        
    }
    
}
