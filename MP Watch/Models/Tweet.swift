//
//  Tweet.swift
//  MP Watch
//
//  Created by MPWatch Team on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var id: String?
    var text: String?
    var timestamp: Date?
    var retweetCount: Int = 0
    var url: URL?
    
    var name: String?
    var screenname: String?
    var profileUrl: URL?
    var profilePictureUrl: URL?
    var numFollowers: Int?
    
    init(dictionary: NSDictionary) {
        id = dictionary["tweet_id"] as? String
        
        text = dictionary["content"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created"] as? String
        if let timestampString = timestampString {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.date(from: timestampString) as Date?
        }
        
        let tweetUrlString = dictionary["url"] as? String
        if let tweetUrlString = tweetUrlString {
            url = URL(string: tweetUrlString)
        }
        
        name = dictionary["name"] as? String as String?
        screenname = dictionary["twitter_handle"] as! String?
        
        let profileUrlString = dictionary["profile_url"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        
        let profilePictureUrlString = dictionary["profile_pic_link"] as? String
        if let profilePictureUrlString = profilePictureUrlString {
            profilePictureUrl = URL(string: profilePictureUrlString)
        }
        
        numFollowers = dictionary["followers_count"] as! Int?
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
}
