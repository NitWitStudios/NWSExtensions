//
//  CollectionType+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/21/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import Foundation

public extension Collection {
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

public extension MutableCollection where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0...(count as! Int) - 1 {
            let j = Int(arc4random_uniform(UInt32((count as! Int) - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
