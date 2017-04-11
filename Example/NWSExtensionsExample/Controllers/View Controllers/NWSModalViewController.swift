//
//  NWSModalViewController.swift
//  NWSExtensions
//
//  Created by James Hickman on 3/14/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import NWSExtensions

class NWSModalViewController: UIViewController {
    var animator: NWSModalAnimator!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - UIViewController

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.modalPresentationStyle = .overFullScreen
        self.animator = NWSModalAnimator()
        self.transitioningDelegate = self.animator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.clear
        
        containerView.roundCornersWithRadius(4.0)
    }
    
    // MARK: - NWSModalViewController
    
    class func viewControllerFromStoryboardInstance() -> NWSModalViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: NWSModalViewControllerIdentifier) as! NWSModalViewController
        return viewController
    }
    
    @IBAction func doneBarButtonItemPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
