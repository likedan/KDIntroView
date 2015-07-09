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
    
    //index : 0 ~ view.frame.width
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        move(icon, index: index, horizontolSpeed: 0, verticalSpeed: -2 / 5)
        icon.alpha = (200 - index) / 200
        
        move(lab1, index: index, horizontolSpeed: 0, verticalSpeed: 2 / 5)
        lab1.alpha = (200 - index) / 200
        
        move(lab2, index: index, horizontolSpeed: -6 / 5, verticalSpeed: -1 / 5)
        move(lab3, index: index, horizontolSpeed: -3 / 5, verticalSpeed: -1 / 10)
        move(lab4, index: index, horizontolSpeed: -4 / 5, verticalSpeed: 0)
        move(lab5, index: index, horizontolSpeed: -3 / 5, verticalSpeed: 1 / 10)
        move(lab6, index: index, horizontolSpeed: -6 / 5, verticalSpeed: 1 / 5)
        
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        if index < frame.width * 0.75 {
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
