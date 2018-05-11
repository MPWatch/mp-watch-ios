//
//  TweetsViewController.swift
//  MP Watch
//
//  Created by Benny Singer on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    var tweets: [Tweet]!
    
    var topic: String!
    
//    static func makeTweetsViewController(topic: String) -> TweetsViewController {
//        let newTweetsViewController = TweetsViewController()
//        
//        newTweetsViewController.topic = topic
//        
//        return newTweetsViewController
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("appears")
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = view.frame.width
        let displayHeight: CGFloat = view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
//        tableView.register(TweetCell.self, forCellReuseIdentifier: "TweetCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 120 //only used for scrollbar height dimension
        
        fetchTweets()
    }
    
    func fetchTweets() {
        APIClient().getTopicTweets(topic: "UKIP", completion: { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
                print("Get here ")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            print(tweets.count)
            return tweets.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("before return")
        return UITableViewCell()
    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("before return")
//        if tweets == nil { return UITableViewCell() }
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
//        cell.cellText = tweets![indexPath.row].text
//        print(cell.cellText)
////        cell.tweet = tweets![indexPath.row]
//
//        return cell
//    }
}
