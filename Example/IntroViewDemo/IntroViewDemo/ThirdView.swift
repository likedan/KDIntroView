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
    
    
    //0 - 640
    override func moveEverythingAccordingToIndex(_ index: CGFloat){
        
        _ = CGAffineTransform(translationX: index, y: 0)
        let offset = index - 250
        let turn = CGAffineTransform(a: 1 - offset / 70,
                                     b: offset / 70 - offset / 210,
                                     c: -offset / 70 + offset / 210,
                                     d: 1 - offset / 70,
                                     tx: offset,
                                     ty: offset * 2.0)
        let transform = CGAffineTransform(a: 1 - (index - 250) / 210, b: 0, c: 0, d: 1 - (index - 250) / 210, tx: -(index - 250) / 2, ty: -(index - 250) / 3)
        
        _ = CGAffineTransform(a: 1 + index / 20, b: 0, c: 0, d: 1 + index / 20, tx: index, ty: 0) //enlarge
        
        /*
        if index < 100{
            self.superview?.backgroundColor = UIColor(red: 32.0/255, green: 176.0/255, blue: 140.0/255, alpha: 1)
        }else if index > 100 && index < 200{
            self.superview?.backgroundColor = UIColor(red: (32.0 + (index - 100) * 1.11)/255, green: (176.0 + (index - 100) * 0.29)/255, blue: (140.0 + (index - 100) * 0.67)/255, alpha: 1)
        }else if index >= 200{
            self.superview?.backgroundColor = UIColor(red: 143.0/255, green: 205.0/255, blue: 232.0/255, alpha: 1)
        }
        */
        if index < 200{
            vertical.alpha = 0
            horizontal.alpha = 1
            vertical.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            horizontal.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        }else if index > 250 && index <= 320 {
            vertical.transform = turn
            vertical.alpha = (index - 250) / 70
            horizontal.transform = transform
            portrait.alpha = (index - 250) / 70
            landscape.alpha = (index - 250) / 70
            
        }else if index > 320{
            let offset = index - 320
            vertical.transform = CGAffineTransform(a: 0,
                                                   b: 0.6777777,
                                                   c: -0.6777777,
                                                   d: 0,
                                                   tx: 70,
                                                   ty: 140 + -offset * offset / 30)
            horizontal.transform = CGAffineTransform(a: 0.6777777, b: 0, c: 0, d: 0.6777777, tx: -35, ty: -23.333 + (index - 320) * (index - 320) / 20)
            
            vertical.alpha =  1 - (index - 320) / 100
            horizontal.alpha = 1 - (index - 320) / 100
            portrait.alpha = 1 - (index - 320) / 100
            landscape.alpha = 1 - (index - 320) / 100
        }
        
        if index <= 280{
            lab1.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            lab1.alpha = 1
        }else if index > 280 && index < 320{
            lab1.transform = CGAffineTransform(a: 1 + (index - 280) / 100, b: 0, c: 0, d: 1 + (index - 280) / 100, tx: 0, ty: index - 280)
            lab1.alpha = 1
        }else if index >= 320 {
            lab1.transform = CGAffineTransform(a: 1.4 - (index - 320) / 70, b: 0, c: 0, d: 1.4 - (index - 320) / 70, tx: -(index - 320) * 3, ty: 40 + (index - 320) * (index - 320) / 20)
            lab1.alpha = (420 - index) / 100
        }
                
    }
    
}

