//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Experion on 05/03/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var byLineLabel: UILabel?
    @IBOutlet var sourceLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(dataModel: NewsModel?) {
        if let _dataModel = dataModel {
            self.titleLabel?.text = _dataModel.title
            self.byLineLabel?.text = _dataModel.byline
            self.sourceLabel?.text = _dataModel.source
            self.dateLabel?.text = _dataModel.published_date
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
