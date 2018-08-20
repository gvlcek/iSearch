//
//  ViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 14/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var loadingView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    //loader activity
    func showLoading() {
        var frame: CGRect?
        frame = UIApplication.shared.keyWindow?.frame
        
        if (loadingView == nil) {
            loadingView = UIView(frame: frame!)
            if let loadingView = loadingView {
                loadingView.backgroundColor = .black
                loadingView.alpha = 0.5
                
                UIApplication.shared.keyWindow?.addSubview(loadingView)
                
                let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
                indicatorView.startAnimating()
                indicatorView.center = loadingView.center
                loadingView.addSubview(indicatorView)
            }
        }
        
        loadingView?.isHidden = false
    }
    
    func hideLoading() {
        loadingView?.isHidden = true
    }
    
    //Alertbox
    func messageBox(titleText: String, messageText: String){
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Entendido", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

