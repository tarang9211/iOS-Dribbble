//
//  DribbbleApi.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

typealias ShotsAlias = ([DribbbleShotsModel]?, NSError?) -> Void

/*DribbleApiService will call the generic HttpService helper functions*/
class DribbleApiService {

  class func fetchShots(completion: @escaping ShotsAlias) {

    let url = Config.rootUrl + "?access_token=\(Config.accessToken)"

    // swiftlint:disable force_unwrapping
    HttpService.fetchData(url: URL(string: url)!) { (data, error) in
      if error != nil {
      }

      guard let response = data else { return }

      let shots: [DribbbleShotsModel] = response.map({ (data) -> DribbbleShotsModel in
        // swiftlint:disable force_cast
        let item        = data as! NSDictionary
        let title       = item["title"] as? String ?? ""
        let id          = item["id"] as? Int ?? 0
        let username    = item["username"] as? String ?? ""
        let viewscount  = item["views_count"] as? Int ?? 0
        let name        = item["name"] as? String ?? ""
        let likes       = item["likes_count"] as? Int ?? 0
        let _           = item["tags"] as? [String] ?? []
        let avatar      = (item["user"] as? NSDictionary)?["avatar_url"] as? String

        // swiftlint:disable force_cast
        let imgUrls     = (item["images"] as! [String: Any])

        return DribbbleShotsModel(title: title, id: id, username: username,
                                  viewscount: viewscount, name: name, likes: likes,
                                  avatarUrl: avatar, imgUrls: imgUrls)
      })
      DispatchQueue.main.async {
        completion(shots, nil)
      }
    }
  }
}
