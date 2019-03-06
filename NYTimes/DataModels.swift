//
//  DataModels.swift
//  NYTimes
//
//  Created by Experion on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

class NewsBaseModel: Codable {
    var results: [NewsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
}

class NewsModel: Codable {
    var title: String?
    var published_date : String?
    let source: String?
    let byline: String?
    let url: String?
    private enum CodingKeys: String, CodingKey {
        case title, published_date, source, byline, url
    }
}
