//
//  ViewController.swift
//  NWSExtensions
//
//  Created by James Hickman on 09/01/2016.
//  Copyright (c) 2016 James Hickman. All rights reserved.
//

import UIKit
import NWSExtensions

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.roundCornersWithRadius(5.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

