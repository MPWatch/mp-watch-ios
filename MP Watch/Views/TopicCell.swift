//
//  TopicCell.swift
//  MP Watch
//
//  Created by Benny Singer on 5/11/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TopicCell: UICollectionViewCell {
    
    @IBOutlet weak var topicButton: UIButton!
    
    var parentViewController: TweetsViewController?
    
    var topic: Topic? {
        didSet {
            topicButton.setTitle("\(topic?.topic! ?? "") (\(topic?.tweetCount! ?? 0))", for: UIControlState.normal)
        }
    }
    @IBAction func topicChosen(_ sender: Any) {
        parentViewController!.currentTopic = topic
    }
    
}
