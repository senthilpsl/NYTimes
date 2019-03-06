//
//  NewsViewModel.swift
//  NYTimes
//
//  Created by Experion on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

class NewsViewModel: NSObject {
    
    var newsModels: [NewsModel]?

    func getNews(completion: @escaping (([NewsModel]?, Error?) -> ())) {
        NetworkClient().getData() { (data, error) in
            guard let _data = data else {
                completion(nil, error)
                return
            }
            do {
                let data = try JSONDecoder().decode(NewsBaseModel.self, from: _data)
                completion(data.results, error)
            } catch {
                print(error)
                completion(nil, error)
            }
        }
    }
}
