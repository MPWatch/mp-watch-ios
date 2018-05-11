//
//  TweetsViewController.swift
//  MP Watch
//
//  Created by Benny Singer on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tweets: [Tweet]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension //use AutoLayout
        tableView.estimatedRowHeight = 120 //only used for scrollbar height dimension
        
        tweets = [Tweet(dictionary: [
            "added": "Fri, 04 May 2018 00:00:00 GMT",
            "content": "A great night for #Havant @Conservatives, taking both UKIP seats and electing 7 new, first time councillors in the 2026 https://t.co/EHIJk0cJCq",
            "created": "Fri May 04 00:16:16 +0000 2018",
            "entity": "UKIP",
            "followers_count": 6159,
            "name": "Alan Mak",
            "profile_pic_link": "https://pbs.twimg.com/profile_images/875313205593206784/MLIKATL2_normal.jpg",
            "profile_url": "https://t.co/Zv16Beclxa",
            "retweet_count": 4,
            "tweet_id": "992196173309075456",
            "twitter_handle": "@AlanMakMP",
            "url": "https://t.co/EHIJk0cJCq"
            ])]
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
}
