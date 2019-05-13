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
        return Tweet(id: 1234, content: "Hello", user: "Pablo")
    }
}
