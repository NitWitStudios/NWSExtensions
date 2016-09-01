//
//  UIDevice+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 8/5/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import UIKit
import Foundation

extension UIDevice {
    var modelName: String {
        let currentSimulatorDevice = "iPhone 6" // Set simulator device here when testing.
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return currentSimulatorDevice
        default:                                        return identifier
        }
    }
    
    class func iPhone6Plus() -> Bool {
        return UIDevice.currentDevice().modelName == "iPhone 6 Plus" || UIDevice.currentDevice().modelName == "iPhone 6s Plus"
    }
    
    class func iPhone6() -> Bool {
        return UIDevice.currentDevice().modelName == "iPhone 6" || UIDevice.currentDevice().modelName == "iPhone 6s" || UIDevice.currentDevice().modelName == "iPod Touch 6"
    }
    
    class func iPhone5() -> Bool {
        return UIDevice.currentDevice().modelName == "iPhone 5" || UIDevice.currentDevice().modelName == "iPhone 5s" || UIDevice.currentDevice().modelName == "iPhone 5c" || UIDevice.currentDevice().modelName == "iPhone SE" || UIDevice.currentDevice().modelName == "iPod Touch 5"
    }
    
    class func iPhone4() -> Bool {
        return UIDevice.currentDevice().modelName == "iPhone 4" || UIDevice.currentDevice().modelName == "iPhone 4s"
    }
    
    class func iPad() -> Bool {
        return UIDevice.currentDevice().modelName == "iPad 2" || UIDevice.currentDevice().modelName == "iPad 3" || UIDevice.currentDevice().modelName == "iPad 4" || UIDevice.currentDevice().modelName == "iPad Air" || UIDevice.currentDevice().modelName == "iPad Air 2" || UIDevice.currentDevice().modelName == "iPad Mini" || UIDevice.currentDevice().modelName == "iPad Mini 2" || UIDevice.currentDevice().modelName == "iPad Mini 3" || UIDevice.currentDevice().modelName == "iPad Mini 4"
    }
    
    class func iPadPro() -> Bool {
        return UIDevice.currentDevice().modelName == "iPad Pro"
    }
}
