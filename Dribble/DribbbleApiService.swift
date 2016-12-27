//
//  DribbbleApi.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

typealias Shots_Alias = ([DribbbleShotsModel], NSError?) -> Void

/*DribbleApiService will call the generic HttpService helper functions*/
class DribbleApiService {
    
    class func fetchShots(completion: @escaping Shots_Alias) {
        
        let url = Config.rootUrl + "?access_token=\(Config.accessToken)"
        
        HttpService.fetchData(url: URL(string: url)!) { (data, error) in
            
            if error != nil {
                
            }
            
            guard let response = data else { return }
            
            let shots: [DribbbleShotsModel] = response.map({ (data) -> DribbbleShotsModel in
                let item    = data as! NSDictionary
                print(item)
                let title       = (item["title"] ?? "") as! String
                let id          = (item["id"] ?? 0) as! Int
                let username    = (item["username"] ?? "") as! String
                let viewscount  = (item["views_count"] ?? 0) as! Int
                return DribbbleShotsModel(title: title, id: id, username: username, viewscount: viewscount)
            })
            completion(shots, nil)
        }
    }
}
