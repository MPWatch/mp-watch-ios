//
//  TweetsViewController.swift
//  MP Watch
//
//  Created by Benny Singer on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var tweets: [Tweet]?
    var topics: [Topic]?
    
    var currentTopic: Topic? {
        didSet {
            fetchTweets(topic: (currentTopic?.topic!)!)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension //use AutoLayout
        tableView.estimatedRowHeight = 120 //only used for scrollbar height dimension
        
        topicCollectionView.dataSource = self
        
        fetchTopics()
    }
    
    func fetchTopics() {
        APIClient().getTopics(completion: { (topics: [Topic]?, error: Error?) in
            if let topics = topics {
                self.topics = topics.sorted(by: { $0.tweetCount! > $1.tweetCount! })
                self.topicCollectionView.reloadData()
                self.currentTopic = self.topics![0]
            }
        })
    }
    
    func fetchTweets(topic: String) {
        APIClient().getTopicTweets(topic: topic, completion: { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            return tweets.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tweets == nil { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets![indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let topics = topics {
            return topics.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCell
        cell.topic = topics![indexPath.row]
        cell.parentViewController = self
        
        return cell
    }
}
