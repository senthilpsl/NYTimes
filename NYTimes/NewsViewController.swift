//
//  ViewController.swift
//  NYTimes
//
//  Created by Senthil on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView?
    var viewModel: NewsViewModel = {
        return NewsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel.getNews { (newsModels, error) in
            if error == nil {
                self.viewModel.newsModels = newsModels
                DispatchQueue.main.async {
                    self.tableview?.reloadData()
                }
            }
        }
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "newscell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        let dataModel = viewModel.newsModels?[indexPath.row]
        cell.setUpCell(dataModel: dataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webController = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController {
            let dataModel = viewModel.newsModels?[indexPath.row]
            webController.urlString = dataModel?.url ?? ""
            self.navigationController?.pushViewController(webController, animated: true)
        }
    }
}

