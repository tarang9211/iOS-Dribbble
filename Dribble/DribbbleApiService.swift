//
//  DribbbleApi.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

typealias Shots_Alias = ([DribbbleModel], NSError?) -> Void

/*DribbleApiService will call the generic HttpService helper functions*/
class DribbleApiService {
    
    class func fetchShots(completion: Shots_Alias) {
        
        let url = Config.rootUrl + "?access_token=\(Config.accessToken)"
        HttpService.fetchData(url: URL(string: url)!) { (data, error) in
            
        }
    }
}
