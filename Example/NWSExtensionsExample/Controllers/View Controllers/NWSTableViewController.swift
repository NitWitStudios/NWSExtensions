//
//  NWSTableViewController.swift
//  NWSExtensions
//
//  Created by James Hickman on 3/19/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

let NWSModalViewControllerIdentifier = "NWSModalViewControllerIdentifier"
let NWSTableViewControllerTableViewCellIdentifier = "NWSModalViewControllerTableViewCellIdentifier"

enum NWSTableViewControllerRow: Int {
    case modalAnimatorBlurred
    case modalAnimatorTransparent
    case rowCount
}

class NWSTableViewController: UITableViewController {
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: NWSTableViewControllerTableViewCellIdentifier)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NWSTableViewControllerRow.rowCount.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NWSTableViewControllerTableViewCellIdentifier, for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.5
        cell.textLabel?.text = stringForRow(NWSTableViewControllerRow(rawValue: indexPath.row)!)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
        
        switch indexPath.row {
        case NWSTableViewControllerRow.modalAnimatorBlurred.rawValue:
            let modalViewController = NWSModalViewController.viewControllerFromStoryboardInstance()
            modalViewController.animator.type = .blurred
            self.navigationController?.present(modalViewController, animated: true, completion: nil)
            break
        case NWSTableViewControllerRow.modalAnimatorTransparent.rawValue:
            let modalViewController = NWSModalViewController.viewControllerFromStoryboardInstance()
            modalViewController.animator.type = .transparent
            self.navigationController?.present(modalViewController, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    // MARK: - Helpers
    
    func stringForRow(_ row: NWSTableViewControllerRow) -> String {
        switch row {
        case .modalAnimatorBlurred:
            return "Modal Animator w/ Blurred Background"
        case .modalAnimatorTransparent:
            return "Modal Animator w/ Transparent Background"
        default:
            return ""
        }
    }
}
