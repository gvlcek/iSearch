//
//  HomeTableViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    fileprivate var media = [MediaContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMediaContent()
    }
    
    private func fetchMediaContent(){
        ItunesServices.getContent(){ [weak self]
            responseObject in
            guard let strongSelf = self else { return }
            if let responseObject = responseObject {
                strongSelf.media = responseObject
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvShowCell", for: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

}
