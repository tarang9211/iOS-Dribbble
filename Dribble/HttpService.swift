//
//  HttpService.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

/*Declaring alias to make code more readable*/
typealias ResponseAlias = (NSArray?, Error?) -> Void

class HttpService {
  class func fetchData(url: URL, completion: @escaping ResponseAlias) {
    let session = URLSession.shared
    let _ = session.dataTask(with: url) { (data, _, error) in

      //Error occured
      if error != nil {
        completion(nil, error)
      }

      if let data = data {
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSArray else {
          //error occured during serialization
          return
        }

        completion(jsonData, nil)
      }
    }.resume()
  }
}
