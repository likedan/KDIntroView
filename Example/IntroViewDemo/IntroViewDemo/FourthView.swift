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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addYears()
    }
    
    func toInitialState(){
        
        self.backgroundColor = UIColor.clear
        _ = CGAffineTransform(a: 20, b: 0, c: 0, d: 20, tx: 0, ty: 0)
        
    }
    
    override func moveEverythingAccordingToIndex(_ index: CGFloat){
        
        _ = CGAffineTransform(translationX: index, y: 0) // stay
        _ = CGAffineTransform(translationX: index, y: -index / 3) //up
        _ = CGAffineTransform(translationX: -index/5, y: 0) //speed1
        _ = CGAffineTransform(translationX: index/4, y: 0) //speed2
        _ = CGAffineTransform(a: 1 + index / 20, b: 0, c: 0, d: 1 + index / 20, tx: index, ty: 0) //enlarge
        
        if index < 200{
            let slideMotion = CGAffineTransform(translationX: -320 + index, y: 200 - index)
            slideBoard.transform = slideMotion
        }else if index >= 200 && index <= 220 {
            slideBoard.transform = CGAffineTransform(translationX: -320 + index, y: 200 - index)
        }else if index > 220 && index < 230{
            slideBoard.transform = CGAffineTransform(translationX: -320 + index, y: -(230 - index) * 2)
        }else if index >= 220 && index <= 320{
            slideBoard.transform = CGAffineTransform(translationX: -320 + index, y: 0)
        }else if index > 320{
            slideBoard.transform = CGAffineTransform(translationX: -320 + index, y: (320 - index) * 2)
        }
        
        if index > frame.width * 1.7{
            slipBoard.backgroundColor = UIColor.clear
        }else{
            slipBoard.backgroundColor = UIColor.white
        }
        
        if index < 100{
            lab1.transform = CGAffineTransform(translationX: 0, y: 200)
            lab2.transform = CGAffineTransform(translationX: 0, y: 200)
            lab3.transform = CGAffineTransform(translationX: 0, y: 200)
        }else if index >= 100 && index <= 140{
            lab1.transform = CGAffineTransform(translationX: 0, y: (140 - index) * 5)
            lab2.transform = CGAffineTransform(translationX: 0, y: 200)
            lab3.transform = CGAffineTransform(translationX: 0, y: 200)
        }else if index > 140 && index < 180{
            lab1.transform = CGAffineTransform(translationX: 0, y: 0)
            lab2.transform = CGAffineTransform(translationX: 0, y: (180 - index) * 5)
            lab3.transform = CGAffineTransform(translationX: 0, y: 200)
        }else if index >= 180 && index <= 200{
            lab1.transform = CGAffineTransform(translationX: 0, y: 0)
            lab2.transform = CGAffineTransform(translationX: 0, y: 0)
            lab3.transform = CGAffineTransform(translationX: 0, y: (200 - index) * 10)
        }else if index > 200{
            lab1.transform = CGAffineTransform(translationX: 0, y: 0)
            lab2.transform = CGAffineTransform(translationX: 0, y: 0)
            lab3.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        if index < 220{
            year1.transform = CGAffineTransform(translationX: 0, y: 0)
            year2.transform = CGAffineTransform(translationX: 0, y: 0)
            year3.transform = CGAffineTransform(translationX: 0, y: 0)
            year4.transform = CGAffineTransform(translationX: 0, y: 0)
        }else if index >= 220 && index <= 240{
            year1.transform = CGAffineTransform(translationX: -(index - 220) * 15, y: 0)
            year2.transform = CGAffineTransform(translationX: 0, y: 0)
            year3.transform = CGAffineTransform(translationX: 0, y: 0)
            year4.transform = CGAffineTransform(translationX: 0, y: 0)
        }else if index > 240 && index < 260{
            year1.transform = CGAffineTransform(translationX: -300, y: 0)
            year2.transform = CGAffineTransform(translationX: -(index - 240) * 15, y: 0)
            year3.transform = CGAffineTransform(translationX: 0, y: 0)
            year4.transform = CGAffineTransform(translationX: 0, y: 0)
        }else if index >= 260 && index <= 280{
            year1.transform = CGAffineTransform(translationX: -300, y: 0)
            year2.transform = CGAffineTransform(translationX: -300, y: 0)
            year3.transform = CGAffineTransform(translationX: -(index - 260) * 15, y: 0)
            year4.transform = CGAffineTransform(translationX: 0, y: 0)
        }else if index > 280 && index < 300{
            year1.transform = CGAffineTransform(translationX: -300, y: 0)
            year2.transform = CGAffineTransform(translationX: -300, y: 0)
            year3.transform = CGAffineTransform(translationX: -300, y: 0)
            year4.transform = CGAffineTransform(translationX: -(index - 280) * 15, y: 0)
        }else if index >= 300 && index <= 320{
            year1.transform = CGAffineTransform(translationX: -300 + (index - 300), y: 0)
            year2.transform = CGAffineTransform(translationX: -300 + (index - 300), y: 0)
            year3.transform = CGAffineTransform(translationX: -300 + (index - 300), y: 0)
            year4.transform = CGAffineTransform(translationX: -300 + (index - 300), y: 0)
            
        }else if index > 320{
            year1.transform = CGAffineTransform(translationX: -600 + index, y: (320 - index))
            year2.transform = CGAffineTransform(translationX: -600 + index, y: (320 - index))
            year3.transform = CGAffineTransform(translationX: -600 + index, y: (320 - index))
            year4.transform = CGAffineTransform(translationX: -600 + index, y: (320 - index))
        }
        
        if index < 320 {
            year.transform = CGAffineTransform(translationX: 0, y: 0)
        }else if index >= 320{
            year.transform = CGAffineTransform(translationX: index - 320, y: (320 - index))
        }
        
        if index < 400{
            logo.alpha = 0
        }else if index >= 400{
            logo.alpha = (index - 400) / 200
        }

        
    }

    func addYears(){
        year1 = UIButton(frame: CGRect(x: 320, y: 80, width: 260, height: 90))
        let angle = CGAffineTransform(rotationAngle: 0.242);
        
        var line = UIImageView(frame: CGRect(x: -0, y: 40, width: 290, height: 4))
        line.backgroundColor = UIColor.white
        line.transform = angle
        year1.addSubview(line)
        
        var label = UILabel(frame: CGRect(x: -60, y: -40, width: 304, height: 110))
        label.text = "2014"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.transform = angle
        year1.addSubview(label)
        addSubview(year1)
        
        year2 = UIButton(frame: CGRect(x: 320, y: 170, width: 260, height: 90))
        line = UIImageView(frame: CGRect(x: -0, y: 40, width: 290, height: 4))
        line.backgroundColor = UIColor.white
        line.transform = angle
        year2.addSubview(line)
        label = UILabel(frame: CGRect(x: -60, y: -40, width: 304, height: 110))
        label.text = "2013"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.transform = angle
        year2.addSubview(label)
        addSubview(year2)
        
        year3 = UIButton(frame: CGRect(x: 320, y: 260, width: 260, height: 90))
        line = UIImageView(frame: CGRect(x: -0, y: 40, width: 290, height: 4))
        line.backgroundColor = UIColor.white
        line.transform = angle
        year3.addSubview(line)
        label = UILabel(frame: CGRect(x: -60, y: -40, width: 304, height: 110))
        label.text = "2012"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.transform = angle
        year3.addSubview(label)
        addSubview(year3)
        
        year4 = UIButton(frame: CGRect(x: 320, y: 350, width: 260, height: 90))
        line = UIImageView(frame: CGRect(x: -0, y: 40, width: 290, height: 4))
        line.backgroundColor = UIColor.white
        line.transform = angle
        year4.addSubview(line)
        label = UILabel(frame: CGRect(x: -60, y: -40, width: 304, height: 110))
        label.text = "2011"
        label.font = UIFont(name: "AvenirNext-Medium", size: 32)
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.transform = angle
        year4.addSubview(label)
        addSubview(year4)
    }

}
