//
//  HomeTableViewController.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController, UISearchBarDelegate {
    
    fileprivate var media = [MediaContent]()
    @IBOutlet private weak var searchBar: UISearchBar!
    
    enum ScopeIndexes: Int {
        case musicIndex = 0
        case tvShowIndex = 1
        case movieIndex = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getMediaType() -> MediaType {
        if searchBar.selectedScopeButtonIndex == ScopeIndexes.musicIndex.rawValue {
            return .music
        } else if searchBar.selectedScopeButtonIndex == ScopeIndexes.tvShowIndex.rawValue {
            return .tvShow
        } else if searchBar.selectedScopeButtonIndex == ScopeIndexes.movieIndex.rawValue {
            return .movie
        } else {
            return .empty
        }
    }
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            ItunesServices.getContent(mediaType: getMediaType(), searchTerm: searchTerm){ [weak self]
                responseObject in
                guard let strongSelf = self else { return }
                if let responseObject = responseObject {
                    strongSelf.media = responseObject
                }
            }
        }
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("CLEAR")
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //switch item.mediaType { }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("print!")
    }

}
