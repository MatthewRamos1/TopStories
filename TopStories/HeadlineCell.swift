//
//  HeadlineCell.swift
//  TopStories
//
//  Created by Matthew Ramos on 11/25/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class HeadlineCell: UITableViewCell {

    @IBOutlet weak var headlineImageView: UIImageView!
    @IBOutlet weak var headlineTitleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    
    // to add a corner radius we need to access the layer.cornerRadius property
    // override the layout subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headlineImageView.layer.cornerRadius = 4
    }
    
    func configureCell(for headline: NewsHeadline) {
        headlineTitleLabel.text = headline.title
        bylineLabel.text = headline.byline
    }

}
