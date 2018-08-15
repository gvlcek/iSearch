//
//  HomeViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 14/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private var media = [MediaContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMediaContent()
    }
    
    private func fetchMediaContent(){
        ItunesServices.getContent(){(result: [MediaContent]?) in
            if let result = result {
                for item in result {
                    self.media.append(item)
                }
            }
        }
    }
}
