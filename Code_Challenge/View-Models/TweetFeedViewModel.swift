//
//  TweetFeedViewModel.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/7/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol TweetViewModelView {
    @objc optional var tweetContentLabel: UILabel { get }
    @objc optional var tweetUserLabel: UILabel { get }
}

class TweetFeedViewModel {
    
    // MARK: - Instance Properties
    public let tweet: Tweet
    public let content: String
    public let username: String
    // MARK: - Object Lifecycle
    init(tweet: Tweet) {
        self.tweet = tweet
        self.content = tweet.content
        self.username = tweet.user
    }
    
}

extension TweetFeedViewModel {
    
    public func configure(_ view: TweetViewModelView) {
        view.tweetContentLabel?.text = content
        view.tweetUserLabel?.text = username
    }
}
