//
//  ViewController.swift
//  IntroView
//
//  Created by Kedan Li on 14/11/10.
//  Copyright (c) 2014年 Kedan Li. All rights reserved.
//

import UIKit

open class KDIntroViewController: UIViewController, UIScrollViewDelegate{
    
    open var scroller: UIScrollView!
    open var pageControl: UIPageControl!
    
    var dragger: UIView!
    
    var introViews = [KDIntroView]()
    
    var currentPageNum:Int = 0
    
    
    open override func viewWillAppear(_ animated: Bool) {
        // initialization
        scroller = UIScrollView(frame: view.frame)
        scroller.showsHorizontalScrollIndicator = false
        scroller.delegate = self
        dragger = UIView(frame: view.frame)
        dragger.backgroundColor = UIColor.clear
        let gestureReco = UIPanGestureRecognizer(target: self, action: #selector(KDIntroViewController.dragged(_:)))
        dragger.addGestureRecognizer(gestureReco)
        
        
        view.addSubview(scroller)
        view.addSubview(dragger)
    }
    
    open func setup(_ views: [String]){
        
        for index in 0 ..< views.count {
            
            let introView = Bundle.main.loadNibNamed(views[index], owner: self, options: nil)?[0] as! KDIntroView
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
            pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
            pageControl.backgroundColor = UIColor.clear
            pageControl.pageIndicatorTintColor = UIColor.gray
            pageControl.currentPageIndicatorTintColor = UIColor.white
            pageControl.currentPage = 0
            pageControl.center = CGPoint(x: view.frame.width / 2, y: view.frame.height * 6 / 7)
        }
        pageControl.numberOfPages = views.count
        view.addSubview(pageControl)
        
        
    }
    
    func determineCurrentPage(){
        if scroller.contentOffset.x > view.frame.width / 2 + view.frame.width * CGFloat(currentPageNum) && currentPageNum < pageControl.numberOfPages{
            currentPageNum += 1
        }else if scroller.contentOffset.x < view.frame.width * CGFloat(currentPageNum - 1) + view.frame.width / 2 && currentPageNum > 0{
            currentPageNum -= 1
        }
        pageControl.currentPage = currentPageNum
        scroller.setContentOffset(CGPoint(x: view.frame.width * CGFloat(currentPageNum), y: 0), animated: true)
    }
    
    
    func dragged(_ recognizer : UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        scroller.setContentOffset(CGPoint(x: view.frame.width * CGFloat(currentPageNum) - translation.x, y: 0), animated: false)
        
        if recognizer.state == UIGestureRecognizerState.cancelled || recognizer.state == UIGestureRecognizerState.failed || recognizer.state == UIGestureRecognizerState.ended{
            // should change page
            if abs(translation.x) > 30 {
                if currentPageNum != 0 && translation.x > 0 {
                    currentPageNum -= 1
                }else if currentPageNum != pageControl.numberOfPages - 1 && translation.x < 0{
                    currentPageNum += 1
                }
                pageControl.currentPage = currentPageNum
            }
            scroller.setContentOffset(CGPoint(x: view.frame.width * CGFloat(currentPageNum), y: 0), animated: true)
            
        }
        
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scroller.contentOffset.x
        
        for index in 0 ..< introViews.count {
            if introViews[index].isInBound(offset){
                var movingIndex = offset
                if index >= 2{
                    movingIndex = offset - CGFloat(index - 1) * view.frame.width
                }
                introViews[index].moveEverythingAccordingToIndex(movingIndex)
            }
            moveEverythingAccordingToIndex(offset)
        }
    }
    //index : 0 ~ scrollview.contentsize
    open func moveEverythingAccordingToIndex(_ index: CGFloat){
        fatalError("Must Override")
    }
    
    open func changeBackgroundColor(_ index: CGFloat, fromColor: UIColor, toColor: UIColor, fromIndex: CGFloat, toIndex: CGFloat){
        
        if index > fromIndex && index < toIndex{
            let difference = toIndex - fromIndex
            let fromColorComponent = fromColor.cgColor.components
            let toColorComponent = toColor.cgColor.components
            
            let differenceInRed = ((toColorComponent?[0])! as CGFloat) - (fromColorComponent?[0])! as CGFloat
            let differenceInGreen = ((toColorComponent?[1])! as CGFloat) - (fromColorComponent?[1])! as CGFloat
            let differenceInBlue = ((toColorComponent?[2])! as CGFloat) - (fromColorComponent?[2])! as CGFloat
            view.backgroundColor = UIColor(red: (fromColorComponent?[0])! as CGFloat + differenceInRed / difference * (index - fromIndex), green: (fromColorComponent?[1])! as CGFloat + differenceInGreen / difference * (index - fromIndex), blue: (fromColorComponent?[2])! as CGFloat + differenceInBlue / difference * (index - fromIndex), alpha: 1)
        }
        
    }
    
}
