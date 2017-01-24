//
//  DribbbleModel.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

class DribbbleShotsModel {
  var title: String
  var id: Int
  var username: String
  var viewscount: Int
  var name: String
  var likes: Int
  var avatarUrl: URL?
  var imgUrls: [String: Any]

  init(title: String, id: Int, username: String, viewscount: Int, name: String, likes: Int, avatarUrl: String?, imgUrls: [String: Any]) {
    self.title      = title
    self.id         = id
    self.username   = username
    self.viewscount = viewscount
    self.name       = name
    self.likes      = likes
    self.imgUrls    = imgUrls

    if let url = avatarUrl, let avatar = URL(string: url) {
      self.avatarUrl = avatar
    } else {
      self.avatarUrl = nil
    }
  }
}

extension DribbbleShotsModel {
  class func returnValidShotURL(urls: [String: Any]) -> URL? {

    if let normalUrl = urls["normal"] as? String, let url = URL(string: normalUrl) {
      return url
    }

    if let teaserUrl = urls["teaser"] as? String, let url = URL(string: teaserUrl) {
      return url
    }

    if let hidpiUrl = urls["hidpi"] as? String, let url = URL(string: hidpiUrl) {
      return url
    }

    return nil
  }
}
