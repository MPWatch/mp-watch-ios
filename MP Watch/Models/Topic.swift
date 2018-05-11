//
//  Topic.swift
//  MP Watch
//
//  Created by MPWatch Team on 5/11/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class Topic: NSObject {
    var topic: String?
    var tweetCount: Int?
    
    init(dictionary: NSDictionary) {
        topic = dictionary["topic"] as? String
        tweetCount = dictionary["count"] as? Int
    }
    
    class func topicsWithArray(dictionaries: [NSDictionary]) -> [Topic] {
        var topics = [Topic]()
        
        for dictionary in dictionaries {
            let topic = Topic(dictionary: dictionary)
            topics.append(topic)
        }
        
        return topics
    }
}
