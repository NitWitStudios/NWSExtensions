//
//  UINavigationController+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/30/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import UIKit
import Foundation

public extension UINavigationController {
    open override var preferredStatusBarStyle : UIStatusBarStyle {
        return self.visibleViewController!.preferredStatusBarStyle
    }
    
    open override var shouldAutorotate : Bool {
        return self.visibleViewController!.shouldAutorotate
    }
    
    open override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return self.visibleViewController!.supportedInterfaceOrientations
    }
}
