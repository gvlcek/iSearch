//
//  AuxiliarFunctions.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 16/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import Foundation
import UIKit

enum ScopeIndexes: Int {
    case musicIndex = 0
    case tvShowIndex = 1
    case movieIndex = 2
}

func getMediaType(_ index: Int) -> MediaType {
    switch index {
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
