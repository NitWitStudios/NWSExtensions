//
//  Range+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 8/2/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import Foundation

public extension Range {
    var randomInt: Int {
        get {
            var offset = 0
            if (lowerBound as! Int) < 0 {
                offset = abs(lowerBound as! Int)
            }
            
            let mini = UInt32(lowerBound as! Int + offset)
            let maxi = UInt32(upperBound   as! Int + offset)
            
            return Int(mini + arc4random_uniform(maxi - mini)) - offset
        }
    }
}
