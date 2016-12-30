//
//  DribbbleModel.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

class DribbbleShotsModel {
    var title       : String
    var id          : Int
    var username    : String
    var viewscount  : Int
    var name        : String
    var likes       : Int
    var avatar_url  : URL
    var imgUrls     : [String: String]
    
    init(title: String, id: Int, username: String, viewscount: Int, name: String, likes: Int, avatar_url: String, imgUrls: [String: String]) {
        self.title      = title
        self.id         = id
        self.username   = username
        self.viewscount = viewscount
        self.name       = name
        self.likes      = likes
        self.avatar_url = URL(string: avatar_url)!
        self.imgUrls    = imgUrls
    }
}
