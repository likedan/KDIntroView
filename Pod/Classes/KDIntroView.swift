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
    open func moveEverythingAccordingToIndex(_ index: CGFloat) {
        fatalError("Must Override")
    }
    // the view stays in the same position as user scroll
    open func still(_ view: UIView, index: CGFloat){
        view.transform = CGAffineTransform(translationX: index, y: 0)
    }
    // horizontolSpeed: positive value for moving right, negative value for moving left, 0 for the same speed as scroll view
    // verticalSpeed: positive value for moving down, negative value for moving up
    open func move(_ view: UIView, index: CGFloat, horizontolSpeed: CGFloat, verticalSpeed: CGFloat){
        view.transform = CGAffineTransform(translationX: index * (horizontolSpeed + 1), y: index * verticalSpeed)
    }
    
    func isInBound(_ num: CGFloat)->Bool{
        if num >= lowerBound && num <= uppserBound{
            return true
        }
        return false
    }
    
}
