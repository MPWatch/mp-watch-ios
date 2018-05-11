//
//  APIClient.swift
//  MP Watch
//
//  Created by Benny Singer on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    static let sharedInstance = APIClient()
    
    static let baseUrl = "https://mp-watch.lifeissababa.com/"
    var session: URLSession
    
    override init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getTopicTweets(topic: String, completion: @escaping ([Tweet]?, Error?) -> ()) {
        let url = URL(string: APIClient.baseUrl + "/tweets?topic=\(topic)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [NSDictionary]
                
                let tweets = Tweet.tweetsWithArray(dictionaries: dataDictionary)
                completion(tweets, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
