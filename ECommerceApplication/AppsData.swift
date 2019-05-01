//
//  AppsData.swift
//  ECommerceApplication
//
//  Created by brn.developers on 4/30/19.
//  Copyright © 2019 Vivek. All rights reserved.
//

import Foundation

struct AppleApps:Codable {
    var feed:Feed
}
struct Feed:Codable {
    var title:String
    var results:[Results]
}
struct Results:Codable {
    var name:String
    var artworkUrl100:String
}


