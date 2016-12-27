//
//  HttpService.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

/*Declaring alias to make code more readable*/
typealias Response_Alias = (NSArray?, Error?) -> Void

class HttpService {
    
    class func fetchData(url: URL, completion: @escaping Response_Alias) {
        
        let session = URLSession.shared
        let _ = session.dataTask(with: url) { (data, response, error) in

            
            //Error occured
            if error != nil {
                completion(nil, error)
            }
            
            if data != nil {
                let jsonData = try? JSONSerialization.jsonObject(with: data! , options: .mutableContainers) as! NSArray
                completion(jsonData, nil)
            }
            
            
            
            
        }.resume()
    }
}
