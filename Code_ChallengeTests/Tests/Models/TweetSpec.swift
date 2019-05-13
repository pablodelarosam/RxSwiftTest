//
//  TweetSpec.swift
//  Code_ChallengeTests
//
//  Created by Pablo de la Rosa Michicol on 5/12/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick


class TweetSpec: QuickSpec {}

// MARK: - Tests
extension TweetSpec {
    override func spec()
    {
        /* In a future approach we can consider test the information coming from a backend, thus we can evaluate we are not missing a key */
        describe("valid tweet") {
            var tweet: Tweet!
            context("when a tweet is valid") {
                beforeEach {
                    tweet = Tweet(id: 123, content: "Hello", user: "Pablo")
                }
                it("sets isLoggedIn.value = `true`") {
                    expect(tweet.user).to(equal("Pablo"))
                }
                
            }
        }
        
        describe("decode") {
            var jsonData: Data!
            var decoder: JSONDecoder!
            
            beforeEach {
                decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            }
            
            context("valid json") {
                beforeEach {
                    jsonData = TweetFake.data(forJson: "tweet-valid")
                }
                it("constructs Tweet instance") {
                    let expected = TweetFake.validTweet()
                    expect { try decoder.decode(Tweet.self, from: jsonData) }.to(equal(expected))
                }
            }
            
            context("missing key") {
                beforeEach {
                    jsonData = TweetFake.data(forJson: "tweet-invalid")
                }
                
                it("throws error") {
                    expect { try decoder.decode(Tweet.self, from: jsonData) }.to(throwError())
                }
            }
        }

    }
}
