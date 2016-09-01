//
//  UIView+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/27/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import UIKit
import Foundation

public extension UIView {
    func cropAsCircle() {
        roundCornersWithRadius(self.bounds.width/2.0)
    }
    
    func roundCornersWithRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func removeCrop() {
        layer.cornerRadius = 0.0
    }
    
    func addBorder(withWidth width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.CGColor
    }
    
    func removeBorder() {
        layer.borderWidth = 0.0
        layer.borderColor = UIColor.clearColor().CGColor
    }
    
    func addSubviewWithFullConstraints(subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let metrics = [ String: AnyObject ]()
        let views = [ "subview" : subview ]
        
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[subview]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subview]|", options: [], metrics: metrics, views: views))
        
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithCenteredConstraints(subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = NSLayoutConstraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: subview, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .Left, relatedBy: .GreaterThanOrEqual, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .Right, relatedBy: .GreaterThanOrEqual, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([xConstraint, yConstraint, leftConstraint, rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithBottomConstraints(subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .GreaterThanOrEqual, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithTopConstraints(subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .Bottom, relatedBy: .GreaterThanOrEqual, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
}
