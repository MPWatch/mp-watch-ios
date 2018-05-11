//
//  TopicCell.swift
//  MP Watch
//
//  Created by MPWatch Team on 5/11/18.
//  Copyright © 2018 MPWatch. All rights reserved.
//

import UIKit

class TopicCell: UICollectionViewCell {
    @IBOutlet weak var topicLabel: UILabel!

    var parentViewController: TweetsViewController?

    var topic: Topic? {
        didSet {
            topicLabel.text = "\(topic?.topic! ?? "") (\(topic?.tweetCount! ?? 0))"
            topicLabel.sizeToFit()
        }
    }
}
