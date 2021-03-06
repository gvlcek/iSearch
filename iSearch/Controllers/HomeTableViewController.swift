//
//  HomeTableViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit
import AVKit

class HomeTableViewController: BaseTableViewController {
    
    fileprivate var media = [MediaContent]()
    @IBOutlet private weak var searchBar: UISearchBar!
    
    fileprivate let tvShowCellIdentifier = "tvShowCell"
    fileprivate let movieCellIdentifier = "movieCell"
    fileprivate let musicCellIdentifier = "musicCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = searchBar.barTintColor?.cgColor
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        media = [MediaContent]()
        reloadTableView()
        searchBar.text = ""
    }
}

extension HomeTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showLoading()
        if let searchTerm = searchBar.text {
            ItunesServices.getContent(mediaType: getMediaType(searchBar.selectedScopeButtonIndex), searchTerm: searchTerm){ [weak self]
                responseObject in
                guard let strongSelf = self else { return }
                if let responseObject = responseObject {
                    strongSelf.media = responseObject
                    strongSelf.reloadTableView()
                    strongSelf.hideLoading()
                } else {
                    strongSelf.messageBox(titleText: "Error de conexión", messageText: "Intente nuevamente mas tarde")
                    strongSelf.hideLoading()
                }
            }
        }
        searchBar.resignFirstResponder()
    }
}

extension HomeTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = media[indexPath.row]
    
        switch row.mediaType {
        case .music?:
            let cell = tableView.dequeueReusableCell(withIdentifier: musicCellIdentifier, for: indexPath) as! MusicCell
            cell.setupCell(title: row.trackName ?? "" , artist: row.artistName ?? "", artworkUrl: row.artworkUrl100 ?? "", previewUrl: row.previewUrl ?? "")
            cell.delegate = self
            return cell
        case .tvShow?:
            let cell = tableView.dequeueReusableCell(withIdentifier: tvShowCellIdentifier, for: indexPath) as! TvShowCell
            cell.setupCell(title: row.artistName ?? "", episode: row.trackName ?? "", sinopsis: row.longDescription ?? "", artworkUrl: row.artworkUrl100 ?? "", previewUrl: row.previewUrl ?? "")
            cell.delegate = self
            return cell
        case .movie?:
            let cell = tableView.dequeueReusableCell(withIdentifier: movieCellIdentifier, for: indexPath) as! MovieCell
            cell.setupCell(title: row.trackName ?? "", sinopsis: row.longDescription ?? "", artworkUrl: row.artworkUrl100 ?? "", previewUrl: row.previewUrl ?? "")
            cell.delegate = self
            return cell
        case .none:
            let cell = tableView.dequeueReusableCell(withIdentifier: musicCellIdentifier, for: indexPath) as! MusicCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reloadTableView()
    }
}

extension HomeTableViewController: MediaContentCellDelegate {
    
    func playMedia(url: String) {
        let mediaUrl = URL(string: url)
        if let mediaUrl = mediaUrl {
            let mediaFile = AVPlayer(url: mediaUrl)
            let mediaPlayer = AVPlayerViewController()
            mediaPlayer.player = mediaFile
            
            present(mediaPlayer, animated: true, completion: {
                    mediaFile.play()
            })
        }
    }
    
}
