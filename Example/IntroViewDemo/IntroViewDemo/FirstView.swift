//
//  FirstView.swift
//  IntroViewDemo
//
//  Created by Kedan Li on 15/7/5.
//  Copyright (c) 2015年 TakeFive Interactive. All rights reserved.
//

import UIKit
import KDIntroView

class FirstView: KDIntroView {
    
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    @IBOutlet var lab4: UILabel!
    @IBOutlet var lab5: UILabel!
    @IBOutlet var lab6: UILabel!
    
    @IBOutlet var icon: UIImageView!
    
    @IBOutlet var iconBack: UIImageView!
    @IBOutlet var iconFront: UIImageView!
    
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var up = CGAffineTransformMakeTranslation(index, -index / 3)
        var down = CGAffineTransformMakeTranslation(index, index / 3)
        var speed1 = CGAffineTransformMakeTranslation(-index / 5, -index / 5)
        var speed2 = CGAffineTransformMakeTranslation(index / 4, -index / 10)
        var speed3 = CGAffineTransformMakeTranslation(-index / 5, 0)
        var speed4 = CGAffineTransformMakeTranslation(index / 4, index / 10)
        var speed5 = CGAffineTransformMakeTranslation(-index / 5, index / 5)
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        lab1.transform = down
        lab1.alpha = (200 - index) / 200
        
        icon.transform = up
        icon.alpha = (200 - index) / 200
        
        lab2.transform = speed1
        
        lab3.transform = speed2
        
        lab4.transform = speed3
        
        lab5.transform = speed4
        
        lab6.transform = speed5
        
        if index < 250{
            iconBack.transform = enlarge
            iconBack.alpha = 1
        }else{
            iconBack.alpha = 0
        }
        
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
