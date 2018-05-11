//
//  TweetsViewController.swift
//  MP Watch
//
//  Created by MPWatch Team on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    var tweets: [Tweet]?
    var topics: [Topic]?
    
    var normalSize: Float?
    
    var currentTopicIndexPath: IndexPath?
    var currentTopic: Topic? {
        didSet {
            fetchTweets(topic: currentTopic!.topic!)
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
        topicCollectionView.delegate = self
        
        let flowLayout = topicCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.estimatedItemSize = CGSize(width: 75, height: 60)
        
        fetchTopics()
    }
    
    func fetchTopics() {
        APIClient().getTopics(completion: { (topics: [Topic]?, error: Error?) in
            if let topics = topics {
                self.topics = topics.sorted(by: { $0.tweetCount! > $1.tweetCount! })
                self.topicCollectionView.reloadData()
                
                self.currentTopic = self.topics![0]
                self.currentTopicIndexPath = IndexPath(row: 0, section: 0)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // if the previously-selected topic is still on screen, unbold it
        if let prev = collectionView.cellForItem(at: currentTopicIndexPath!) as? TopicCell {
            // hacky fix - when a topic initially renders as bold (either because its the first topic or
            // because it leaves the screen after being selected and comes back), it needs to shrink so
            // that its text doesn't cut off when its font increases to 17 non-bold
            prev.topicLabel.font = UIFont.systemFont(ofSize: 16)
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! TopicCell
        currentTopic = cell.topic
        currentTopicIndexPath = indexPath
        cell.topicLabel.font = UIFont.boldSystemFont(ofSize: 16)
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
        
        // this method runs when a cell comes back on screen
        // check if the cell contains the current topic, bold it if it does
        if currentTopic?.topic != cell.topic?.topic {
            cell.topicLabel.font = UIFont.systemFont(ofSize: 17)
        } else {
            cell.topicLabel.font = UIFont.boldSystemFont(ofSize: 16)
        }
        
        return cell
        
    }
    
}
