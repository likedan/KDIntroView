//
//  KDIntroView.swift
//  Pods
//
//  Created by Kedan Li on 15/7/5.
//
//


import UIKit

public class KDIntroView: UIView {
    
    var uppserBound: CGFloat = 0
    
    var lowerBound: CGFloat = 0
    
    //index : 0 ~ 2 * view.frame.width
    public func moveEverythingAccordingToIndex(index: CGFloat) {
        fatalError("Must Override")
    }
    public func still(view: UIView, index: CGFloat){
        view.transform = CGAffineTransformMakeTranslation(index, 0)
    }
    public func move(view: UIView, index: CGFloat, horizontolSpeed: CGFloat, verticalSpeed: CGFloat){
        view.transform = CGAffineTransformMakeTranslation(index * (horizontolSpeed + 1), index * verticalSpeed)
    }
    
    func isInBound(num: CGFloat)->Bool{
        if num >= lowerBound && num <= uppserBound{
            return true
        }
        return false
    }
    
}
