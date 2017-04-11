//
//  UIImage+Extensions.swift
//  Pods
//
//  Created by James Hickman on 2/20/17.
//
//

import UIKit

public extension UIImage {
    class func imageFromLayer(_ layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
