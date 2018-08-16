//
//  HomeTableViewCells.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class TvShowCell: UITableViewCell {
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var showEpisodeLabel: UILabel!
    @IBOutlet weak var showDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
