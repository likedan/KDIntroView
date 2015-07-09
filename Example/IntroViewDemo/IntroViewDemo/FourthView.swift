//
//  FourthView.swift
//  IntroViewDemo
//
//  Created by Kedan Li on 15/7/5.
//  Copyright (c) 2015年 TakeFive Interactive. All rights reserved.
//

import UIKit
import KDIntroView

class FourthView: KDIntroView {

    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    
    @IBOutlet var year: UILabel!
    
    var year1: UIButton!
    var year2: UIButton!
    var year3: UIButton!
    var year4: UIButton!
    
    @IBOutlet var slipBoard: UIView!
    @IBOutlet var logo: UIButton!
    
    
    @IBOutlet var slideBoard: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addYears()
    }
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clearColor()
        var enlarge = CGAffineTransformMake(20, 0, 0, 20, 0, 0)
        
    }
    
    override func moveEverythingAccordingToIndex(index: CGFloat){
        
        var stay = CGAffineTransformMakeTranslation(index, 0)
        var up = CGAffineTransformMakeTranslation(index, -index / 3)
        var speed1 = CGAffineTransformMakeTranslation(-index/5, 0)
        var speed2 = CGAffineTransformMakeTranslation(index/4, 0)
        var enlarge = CGAffineTransformMake(1 + index / 20, 0, 0, 1 + index / 20, index, 0)
        
        if index < 200{
            var slideMotion = CGAffineTransformMakeTranslation(-320 + index, 200 - index)
            slideBoard.transform = slideMotion
        }else if index >= 200 && index <= 220 {
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, 200 - index)
        }else if index > 220 && index < 230{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, -(230 - index) * 2)
        }else if index >= 220 && index <= 320{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, 0)
        }else if index > 320{
            slideBoard.transform = CGAffineTransformMakeTranslation(-320 + index, (320 - index) * 2)
        }
        
        if index > frame.width * 1.7{
            slipBoard.backgroundColor = UIColor.clearColor()
        }else{
            slipBoard.backgroundColor = UIColor.whiteColor()
        }
        
        if index < 100{
            lab1.transform = CGAffineTransformMakeTranslation(0, 200)
            lab2.transform = CGAffineTransformMakeTranslation(0, 200)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index >= 100 && index <= 140{
            lab1.transform = CGAffineTransformMakeTranslation(0, (140 - index) * 5)
            lab2.transform = CGAffineTransformMakeTranslation(0, 200)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index > 140 && index < 180{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, (180 - index) * 5)
            lab3.transform = CGAffineTransformMakeTranslation(0, 200)
        }else if index >= 180 && index <= 200{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, 0)
            lab3.transform = CGAffineTransformMakeTranslation(0, (200 - index) * 10)
        }else if index > 200{
            lab1.transform = CGAffineTransformMakeTranslation(0, 0)
            lab2.transform = CGAffineTransformMakeTranslation(0, 0)
            lab3.transform = CGAffineTransformMakeTranslation(0, 0)
        }
        
        if index < 220{
            year1.transform = CGAffineTransformMakeTranslation(0, 0)
            year2.transform = CGAffineTransformMakeTranslation(0, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 220 && index <= 240{
            year1.transform = CGAffineTransformMakeTranslation(-(index - 220) * 15, 0)
            year2.transform = CGAffineTransformMakeTranslation(0, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index > 240 && index < 260{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-(index - 240) * 15, 0)
            year3.transform = CGAffineTransformMakeTranslation(0, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 260 && index <= 280{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-300, 0)
            year3.transform = CGAffineTransformMakeTranslation(-(index - 260) * 15, 0)
            year4.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index > 280 && index < 300{
            year1.transform = CGAffineTransformMakeTranslation(-300, 0)
            year2.transform = CGAffineTransformMakeTranslation(-300, 0)
            year3.transform = CGAffineTransformMakeTranslation(-300, 0)
            year4.transform = CGAffineTransformMakeTranslation(-(index - 280) * 15, 0)
        }else if index >= 300 && index <= 320{
            year1.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year2.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year3.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            year4.transform = CGAffineTransformMakeTranslation(-300 + (index - 300), 0)
            
        }else if index > 320{
            year1.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year2.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year3.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
            year4.transform = CGAffineTransformMakeTranslation(-600 + index, (320 - index))
        }
        
        if index < 320 {
            year.transform = CGAffineTransformMakeTranslation(0, 0)
        }else if index >= 320{
            year.transform = CGAffineTransformMakeTranslation(index - 320, (320 - index))
        }
        
        if index < 400{
            logo.alpha = 0
        }else if index >= 400{
            logo.alpha = (index - 400) / 200
        }

        
    }

    func addYears(){
        year1 = UIButton(frame: CGRectMake(320, 80, 260, 90))
        var angle = CGAffineTransformMakeRotation(0.242);
        
        var line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        year1.addSubview(line)
        
        var label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2014"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        year1.addSubview(label)
        addSubview(year1)
        
        year2 = UIButton(frame: CGRectMake(320, 170, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        year2.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2013"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        year2.addSubview(label)
        addSubview(year2)
        
        year3 = UIButton(frame: CGRectMake(320, 260, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        year3.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2012"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        year3.addSubview(label)
        addSubview(year3)
        
        year4 = UIButton(frame: CGRectMake(320, 350, 260, 90))
        line = UIImageView(frame: CGRectMake(-0, 40, 290, 4))
        line.backgroundColor = UIColor.whiteColor()
        line.transform = angle
        year4.addSubview(line)
        label = UILabel(frame: CGRectMake(-60, -40, 304, 110))
        label.text = "2011"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.Right
        label.textColor = UIColor.whiteColor()
        label.transform = angle
        year4.addSubview(label)
        addSubview(year4)
    }

}
