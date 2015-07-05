//
//  ViewController.swift
//  IntroView
//
//  Created by Kedan Li on 14/11/10.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

public class KDIntroViewController: UIViewController, UIScrollViewDelegate{
    
    var scroller: UIScrollView!
    var dragger: UIView!
    var pageControl: UIPageControl!
    
    var pageNum = 0
    
    var introViews = [KDIntroView]()
    
    var currentPageNum = 0
    
    
    public  override func viewWillAppear(animated: Bool) {
        scroller = UIScrollView(frame: view.frame)
        scroller.showsHorizontalScrollIndicator = false
        dragger = UIView(frame: view.frame)
        var gestureReco = UIPanGestureRecognizer(target: self, action: "dragged:")
        dragger.addGestureRecognizer(gestureReco)
    }
    
    public func setup(views: [String]){
        
        for var index = 0; index < views.count; index++ {
            var introView = NSBundle.mainBundle().loadNibNamed(views[index], owner: self, options: nil)[0] as! KDIntroView
            introView.center.x = view.center.x + view.frame.width * CGFloat(index)
            scroller.addSubview(introView)
            introViews.append(introView)
            
            if index == 0{
                introView.uppserBound = view.frame.width
                introView.lowerBound = 0
            }else{
                introView.uppserBound = view.frame.width * CGFloat(index + 1)
                introView.lowerBound = view.frame.width * CGFloat(index - 1)
            }
            
        }
        pageNum = views.count
        
    }
    
    func determineCurrentPage(){
        if scroller.contentOffset.x > view.frame.width / 2 + view.frame.width * CGFloat(currentPageNum) && currentPageNum < pageNum{
            currentPageNum++
        }else if scroller.contentOffset.x < view.frame.width * CGFloat(currentPageNum - 1) + view.frame.width / 2 && currentPageNum > 0{
            currentPageNum--
        }
        pageControl.currentPage = currentPageNum
        scroller.setContentOffset(CGPointMake(view.frame.width * CGFloat(currentPageNum), 0), animated: true)
    }
    
    
    func dragged(recognizer : UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(self.view)
        scroller.setContentOffset(CGPointMake(view.frame.width * CGFloat(currentPageNum) - translation.x, 0), animated: false)
        
        if recognizer.state == UIGestureRecognizerState.Cancelled || recognizer.state == UIGestureRecognizerState.Failed || recognizer.state == UIGestureRecognizerState.Ended{
            // should change page
            if abs(translation.x) > 30 {
                if currentPageNum != 0 && translation.x > 0 {
                    currentPageNum--
                }else if currentPageNum != pageNum - 1 && translation.x < 0{
                    currentPageNum++
                }
                pageControl.currentPage = currentPageNum
            }
            scroller.setContentOffset(CGPointMake(view.frame.width * CGFloat(currentPageNum), 0), animated: true)
            
        }
        
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = scroller.contentOffset.x
        
        for var index = 0; index < introViews.count; index++ {
            if introViews[index].isInBound(offset){
                var movingIndex = offset
                if index >= 2{
                    movingIndex = offset - CGFloat(index - 1) * view.frame.width
                }
                println(movingIndex)
                introViews[index].moveEverythingAccordingToIndex(movingIndex)
            }
        }
    }
    
    
    
}

class first: UIView{
    
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    @IBOutlet var lab4: UILabel!
    @IBOutlet var lab5: UILabel!
    @IBOutlet var lab6: UILabel!
    
    @IBOutlet var icon: UIImageView!
    
    @IBOutlet var iconBack: UIImageView!
    @IBOutlet var iconFront: UIImageView!
    
    func moveEverythingAccordingToIndex(index: CGFloat){
        
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
    

}
