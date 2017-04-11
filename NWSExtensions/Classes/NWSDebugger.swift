//
//  NWSDebugger.swift
//  Pods
//
//  Created by James Hickman on 3/16/17.
//
//

import Foundation

public class NWSDebugger: NSObject {
    public class func printToConsole(_ string: String) {
        #if DEBUG
            print(string)
        #endif
    }
    
    public class func logError(_ string: String) {
        printToConsole(string)
    }
}
