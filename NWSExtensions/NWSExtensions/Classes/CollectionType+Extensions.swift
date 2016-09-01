//
//  CollectionType+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/21/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import Foundation

public extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

public extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
