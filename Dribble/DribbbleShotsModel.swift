//
//  DribbbleModel.swift
//  Dribble
//
//  Created by Tarang Hirani on 12/27/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import Foundation

class DribbbleShotsModel {
    var title   :   String
    var id      :   Int
    var username:   String
    var viewscount: Int
    
    init(title: String, id: Int, username: String, viewscount: Int) {
        self.title      = title
        self.id         = id
        self.username   = username
        self.viewscount = viewscount
    }
}
