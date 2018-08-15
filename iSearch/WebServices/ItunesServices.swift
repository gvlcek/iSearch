//
//  ItunesServices.swift
//  iSearch
//
//  Created by Guadalupe Vlcek on 15/08/2018.
//  Copyright © 2018 Guadalupe Vlcek. All rights reserved.
//

import Foundation
import Alamofire

class ItunesServices: NSObject {
    private static let GET_CONTENT = "https://itunes.apple.com/search"
    
    static func getContent(completionHandler: @escaping ([MediaContent]?) -> ()){
        let parameters: Parameters = [
            "term": "House",
            "media": "tvShow",
        ]
        
        Alamofire.request(GET_CONTENT, method: .get, parameters: parameters).responseJSON {
            response in switch response.result {
            case .success(let json):
                let resultsArray = (json as! NSDictionary).object(forKey: "results") as! NSArray
                var returnList = [MediaContent]()
                for case let item as NSDictionary in resultsArray {
                    let curentItem = MediaContent(item)
                    returnList.append(curentItem)
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
