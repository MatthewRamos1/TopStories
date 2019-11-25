//
//  ViewController.swift
//  TopStories
//
//  Created by Matthew Ramos on 11/25/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class NewsFeedController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var headlines = [NewsHeadline]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        headlines = HeadlinesData.getHeadlines()
    }
}
 
extension NewsFeedController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadlineCell else {
            fatalError("Check dequeueResuableCell")
        }
        
        let headline = headlines[indexPath.row]
        cell.configureCell(for: headline)
        return cell
    }
}
