//
//  NewsDetailViewController.swift
//  NYTimes
//
//  Created by Experion on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet var webview: UIWebView?
    var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let _urlString = self.urlString, let url = URL(string: _urlString) {
            let urlRequest = URLRequest(url: url)
            self.webview?.loadRequest(urlRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
