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
    
    func roundCornersWithRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func removeCrop() {
        layer.cornerRadius = 0.0
    }
    
    func addBorder(withWidth width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func removeBorder() {
        layer.borderWidth = 0.0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func addSubviewWithFullConstraints(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let metrics = [ String: AnyObject ]()
        let views = [ "subview" : subview ]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "|[subview]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", options: [], metrics: metrics, views: views))
        
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithCenteredConstraints(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([xConstraint, yConstraint, leftConstraint, rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithBottomConstraints(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
    
    func addSubviewWithTopConstraints(_ subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0)
        
        self.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        self.updateConstraintsIfNeeded()
        self.layoutIfNeeded()
    }
}
