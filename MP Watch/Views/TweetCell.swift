//
//  TweetCell.swift
//  MP Watch
//
//  Created by MPWatch Team on 5/10/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit
import AlamofireImage
import ActiveLabel

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: ActiveLabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            if let profilePictureUrl = tweet.profilePictureUrl {
                profileImageView.af_setImage(withURL: profilePictureUrl)
            } else {
                profileImageView.image = #imageLiteral(resourceName: "profile-Icon")
            }
            profileImageView.layer.cornerRadius = 8.0
            profileImageView.clipsToBounds = true
            
            if let name = tweet.name {
                nameButton.setTitle(name as String, for: .normal)
            } else {
                nameButton.setTitle("", for: .normal)
            }
            
            if let username = tweet.screenname {
                usernameLabel.text = username as String
            } else {
                usernameLabel.text = ""
            }
            
            if let time = tweet.timestamp {
                timeLabel.text = formatDate(date: time)
            } else {
                timeLabel.text = ""
            }
            
            if let tweetText = tweet.text {
                tweetLabel.text = tweetText as String
            } else {
                tweetLabel.text = ""
            }
            
            tweetLabel.customize { tweetLabel in
                tweetLabel.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
                tweetLabel.hashtagColor = UIColor(red: 85.0/255, green: 172.0/255, blue: 238.0/255, alpha: 1)
                tweetLabel.mentionColor = UIColor(red: 238.0/255, green: 85.0/255, blue: 96.0/255, alpha: 1)
                tweetLabel.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            }
        }
    }
    
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
    }
    
    //h/t zemirco (Github)
    func formatDate(date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
        let components = (calendar as NSCalendar).components(unitFlags, from: date, to: now, options: [])
        let currentComponents = (calendar as NSCalendar).components(unitFlags, from: date)
        
        if let day = components.day, day >= 1 {
            return "\(currentComponents.month!)/\(currentComponents.day!)/\(currentComponents.year!)"
        }
        
        if let hour = components.hour, hour >= 1 {
            return "\(hour)hr"
        }
        
        if let minute = components.minute, minute >= 1 {
            return "\(minute)m"
        }
        
        if let second = components.second, second >= 3 {
            return "\(second)s"
        }
        
        return "Just now"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
