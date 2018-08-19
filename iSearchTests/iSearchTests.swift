//
//  iSearchTests.swift
//  iSearchTests
//
//  Created by Guadalupe Vlcek on 14/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import XCTest
@testable import iSearch

class iSearchTests: XCTestCase {
    
    func testgetMediaType(){
        var mediaType = getMediaType(0)
        XCTAssertEqual(mediaType, .music)
        
        mediaType = getMediaType(1)
        XCTAssertEqual(mediaType, .tvShow)
        
        mediaType = getMediaType(2)
        XCTAssertEqual(mediaType, .movie)
        
        mediaType = getMediaType(1232324)
        XCTAssertEqual(mediaType, .tvShow)
    }
}
