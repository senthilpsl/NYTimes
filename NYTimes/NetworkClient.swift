//
//  NetworkClient.swift
//  NYTimes
//
//  Created by Experion on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

let kNewsUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=jlSI2qKsMotAWtdJrUxl40Afz34mMq55"

class NetworkClient: NSObject {
    
    func getData(completion: @escaping ((Data?, Error?) -> ())) {
        let urlStr = kNewsUrl
        let finalUrl = URL(string: urlStr)!
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        print(finalUrl)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let unwrappedData = data else { completion(nil, error); return }
            completion(unwrappedData, nil)
        }).resume()
    }
    
}
