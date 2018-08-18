//
//  HomeTableViewCells.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TvShowCell: UITableViewCell {
    
    @IBOutlet private weak var showImage: UIImageView!
    @IBOutlet private weak var showTitleLabel: UILabel!
    @IBOutlet private weak var showEpisodeLabel: UILabel!
    @IBOutlet private weak var showDescriptionLabel: UILabel!
    
    func setupCell(title: String, episode: String, sinopsis: String, url: String){
        let imageURL = URL(string: url)
        guard let image = imageURL else { return }
        showImage.af_setImage(withURL: image, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        showTitleLabel.text = "Show: " + title
        showEpisodeLabel.text = "Episode: " + episode
        showDescriptionLabel.text = sinopsis
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class MovieCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    
    func setupCell(title: String, sinopsis: String, url: String){
        let imageURL = URL(string: url)
        guard let image = imageURL else { return }
        movieImage.af_setImage(withURL: image, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        movieTitleLabel.text = "Movie: " + title
        movieDescriptionLabel.text = sinopsis
    }
    
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
    
    func setupCell(title: String, artist: String, url: String){
        let imageURL = URL(string: url)
        guard let image = imageURL else { return }
        albumImage.af_setImage(withURL: image, placeholderImage: #imageLiteral(resourceName: "placeholder"))
        songTitleLabel.text = "Track Name: " + title
        artistLabel.text = "Artist: " + artist
    }
}
