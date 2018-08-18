//
//  MediaContent.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 15/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import Foundation
import UIKit

enum MediaType: String {
    case tvShow = "tvShow"
    case movie = "movie"
    case music = "music"
}

class MediaContent: NSObject {
    var trackName: String?
    var artworkUrl100: String?
    var longDescription: String?
    var artistName: String?
    var previewUrl: String?
    var mediaType: MediaType?
 
    convenience init(_ dict: NSDictionary) {
        self.init()
        
        if let trackName = dict.object(forKey: "trackName") as? String {
            self.trackName = trackName
        }
        if let artworkUrl100 = dict.object(forKey: "artworkUrl100") as? String {
            self.artworkUrl100 = artworkUrl100
        }
        if let longDescription = dict.object(forKey: "longDescription") as? String {
            self.longDescription = longDescription
        }
        if let artistName = dict.object(forKey: "artistName") as? String {
            self.artistName = artistName
        }
        if let previewUrl = dict.object(forKey: "previewUrl") as? String {
            self.previewUrl = previewUrl
        }
    }
}
