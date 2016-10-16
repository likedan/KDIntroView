//
//  KDIntroView.swift
//  Pods
//
//  Created by Kedan Li on 15/7/5.
//
//


import UIKit

open class KDIntroView: UIView {
    
    var uppserBound: CGFloat = 0
    
    var lowerBound: CGFloat = 0
    
    //index : 0 ~ 2 * view.frame.width
    open func moveEverythingAccordingToIndex(index: CGFloat) {
        fatalError("Must Override")
    }
    open func still(view: UIView, index: CGFloat){
        view.transform = CGAffineTransform(translationX: index, y: 0)
    }
    open func move(view: UIView, index: CGFloat, horizontolSpeed: CGFloat, verticalSpeed: CGFloat){
        view.transform = CGAffineTransform(translationX: index * (horizontolSpeed + 1), y: index * verticalSpeed)
    }
    
    func isInBound(num: CGFloat)->Bool{
        if num >= lowerBound && num <= uppserBound{
            return true
        }
        return false
    }
    
}
