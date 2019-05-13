//
//  TweetFake.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/12/19.
//  Copyright © 2019 JOOR. All rights reserved.
//
import Foundation

class TweetFake  {
    
    class func data(forJson name: String) -> Data {
        let bundle = Bundle(for: self)
        let url = bundle.url(forResource: name, withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    class func validTweet() -> Tweet {
        return Tweet(id: 1234, content: "Hello!", user: "Joor")
    }
    
    class func validTimeLine() -> [Tweet] {
        let tweets = [  Tweet(id: 1, content: "Oh brother...", user: "Isaac Casanova"),
                        Tweet(id: 2, content: "No idea what this code is doing but LGTM 👍", user: "Austin Feight"),
                        Tweet(id: 3, content: "You miss 100% of the shots you don't miss - Wayne Gretsky - Michael Scott", user: "Jordan Buzzell"),
                        Tweet(id: 4, content: "I'm definitely not driving right now", user: "Dan Katz"),
                        Tweet(id: 5, content: "I did some jawns", user: "Ethan Riback")]
        return tweets
    }
}
