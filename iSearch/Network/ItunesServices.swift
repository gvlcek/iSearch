//
//  ItunesServices.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 15/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import Foundation
import Alamofire

private let GET_CONTENT = "https://itunes.apple.com/search"

class ItunesServices: NSObject {
    
    static func getContent(mediaType: MediaType, searchTerm: String, completionHandler: @escaping ([MediaContent]?) -> ()){
        let parameters: Parameters = [
            "term": searchTerm,
            "media": mediaType.rawValue,
        ]
        
        Alamofire.request(GET_CONTENT, method: .get, parameters: parameters).responseJSON {
            response in switch response.result {
            case .success(let json):
                let resultsArray = (json as! NSDictionary).object(forKey: "results") as! NSArray
                var returnList = [MediaContent]()
                for case let item as NSDictionary in resultsArray {
                    let currentItem = MediaContent(item)
                    currentItem.mediaType = mediaType
                    returnList.append(currentItem)
                }
                completionHandler(returnList)
                break
            case .failure( _):
                completionHandler(nil)
                print("Request Error")
                break
            }
        }
    }
}
