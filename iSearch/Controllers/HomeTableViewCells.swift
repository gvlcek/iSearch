//
//  HomeTableViewCells.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class TvShowCell: UITableViewCell {
    
    @IBOutlet private weak var showImage: UIImageView!
    @IBOutlet private weak var showTitleLabel: UILabel!
    @IBOutlet private weak var showEpisodeLabel: UILabel!
    @IBOutlet private weak var showDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class MovieCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class MusicCell: UITableViewCell {
    @IBOutlet private weak var albumImage: UIImageView!
    @IBOutlet private weak var songTitleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
