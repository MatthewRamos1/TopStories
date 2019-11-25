//
//  NewsHeadlines.swift
//  TopStories
//
//  Created by Matthew Ramos on 11/25/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

    struct HeadlinesData: Codable {
        let results: [NewsHeadline] // results represents the json array of stories
    }
    struct NewsHeadline: Codable {
        let title: String
        let abstract: String
        let byline: String
    }
    extension HeadlinesData {
        static func getHeadlines() -> [NewsHeadline]{
            var headlines = [NewsHeadline]()
            
            // the app Bundle() allows us to access our app resources and file
            
            // get the url to the intended resource
            guard let fileURL = Bundle.main.url(forResource: "topStoriesTechnology", withExtension: "json") else {
            fatalError("could not locate json file")
            }
            
            // get the data from the contents of the fileURL
            do {
             let data = try Data(contentsOf: fileURL)
                
                // parse data to our Swift [NewHeadline]
                let headlinesData = try JSONDecoder().decode(HeadlinesData.self, from: data)
                headlines = headlinesData.results // [NewsHeadline]
            } catch {
                fatalError("failed to load contents")
            }
                    return headlines
        }
    }
