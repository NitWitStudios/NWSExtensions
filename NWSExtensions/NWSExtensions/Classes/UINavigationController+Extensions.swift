//
//  UINavigationController+Extensions.swift
//  Bobblehead-TV
//
//  Created by James Hickman on 7/30/16.
//  Copyright © 2016 NitWit Studios. All rights reserved.
//

import UIKit
import Foundation

extension UINavigationController {
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.visibleViewController!.preferredStatusBarStyle()
    }
    
    public override func shouldAutorotate() -> Bool {
        return self.visibleViewController!.shouldAutorotate()
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return self.visibleViewController!.supportedInterfaceOrientations()
    }
}
