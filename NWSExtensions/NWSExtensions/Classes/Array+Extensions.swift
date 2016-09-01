//
//  Array+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/28/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import Foundation

extension Array
{
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }
}
