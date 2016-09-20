//
//  Array+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/28/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import Foundation

public extension Array
{
    mutating func removeObject<U: Equatable>(_ object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.remove(at: index!)
        }
    }
}
