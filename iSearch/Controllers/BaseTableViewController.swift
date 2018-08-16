//
//  ViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 14/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView() //To prevent showing separators between empty cells
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

}

