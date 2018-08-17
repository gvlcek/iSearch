//
//  AuxiliarFunctions.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

enum ScopeIndexes: Int {
    case musicIndex = 0
    case tvShowIndex = 1
    case movieIndex = 2
}

func getMediaType(_ searchBar: UISearchBar) -> MediaType {
    switch searchBar.selectedScopeButtonIndex {
    case ScopeIndexes.musicIndex.rawValue:
        return .music
    case ScopeIndexes.tvShowIndex.rawValue:
        return .tvShow
    case ScopeIndexes.movieIndex.rawValue:
        return .movie
    default:
        return .tvShow
    }
}

func downloadImage(url: String) -> UIImage {
    var imageResult = UIImage()
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                imageResult = image
            }
        }
    return imageResult
}
