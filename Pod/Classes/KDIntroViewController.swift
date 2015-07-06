//
//  ViewController.swift
//  IntroView
//
//  Created by Kedan Li on 14/11/10.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

public class KDIntroViewController: UIViewController, UIScrollViewDelegate{
    
    public var scroller: UIScrollView!
    public var pageControl: UIPageControl!
    
    var dragger: UIView!
    
    var introViews = [KDIntroView]()
    
    var currentPageNum:Int = 0
    
    
    public override func viewWillAppear(animated: Bool) {
        // initialization
        scroller = UIScrollView(frame: view.frame)
        scroller.showsHorizontalScrollIndicator = false
        scroller.delegate = self
        dragger = UIView(frame: view.frame)
        dragger.backgroundColor = UIColor.clearColor()
        var gestureReco = UIPanGestureRecognizer(target: self, action: "dragged:")
        dragger.addGestureRecognizer(gestureReco)
        
        
        view.addSubview(scroller)
        view.addSubview(dragger)
    }
    
    public func setup(views: [String]){
        
        for var index = 0; index < views.count; index++ {
            
            var introView = NSBundle.mainBundle().loadNibNamed(views[index], owner: self, options: nil)[0] as! KDIntroView
            introView.center.x = view.center.x + view.frame.width * CGFloat(index)
            scroller.addSubview(introView)
            introViews.append(introView)
            
            if index == 0 || index == views.count - 1{
                introView.uppserBound = view.frame.width
                introView.lowerBound = 0
            }else{
                introView.uppserBound = view.frame.width * CGFloat(index + 1)
                introView.lowerBound = view.frame.width * CGFloat(index - 1)
            }
            
        }
        
        // create default page control
        if pageControl == nil{
            pageControl = UIPageControl(frame: CGRectMake(0, 0, 100, 40))
            pageControl.backgroundColor = UIColor.clearColor()
            pageControl.pageIndicatorTintColor = UIColor.grayColor()
            pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
            pageControl.currentPage = 0
            pageControl.center = CGPointMake(view.frame.width / 2, view.frame.height * 6 / 7)
        }
        pageControl.numberOfPages = views.count
        view.addSubview(pageControl)
        
        
    }
    
    func determineCurrentPage(){
        if scroller.contentOffset.x > view.frame.width / 2 + view.frame.width * CGFloat(currentPageNum) && currentPageNum < pageControl.numberOfPages{
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
                }else if currentPageNum != pageControl.numberOfPages - 1 && translation.x < 0{
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