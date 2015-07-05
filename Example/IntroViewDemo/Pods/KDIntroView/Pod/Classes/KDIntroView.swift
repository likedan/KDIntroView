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
    
    //index : 0 - 100
    public func moveEverythingAccordingToIndex(index: CGFloat) {
        fatalError("Must Override")
    }
    
    func isInBound(num: CGFloat)->Bool{
        if num >= lowerBound && num <= uppserBound{
            return true
        }
        return false
    }
    
}
