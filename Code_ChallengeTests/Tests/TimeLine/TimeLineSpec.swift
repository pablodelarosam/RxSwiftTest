//
//  TimeLineSpec.swift
//  Code_ChallengeTests
//
//  Created by Pablo de la Rosa Michicol on 5/12/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick
import Foundation


class TimeLineSpec: QuickSpec {}

// MARK: - Tests
extension TimeLineSpec {
    override func spec()
    {
        describe("valid timeline") {
            describe("decode") {
                var jsonData: Data!
                var decoder: JSONDecoder!
                
                beforeEach {
                    decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                }
                
                context("valid json") {
                    beforeEach {
                        jsonData = TweetFake.data(forJson: "timeLine-valid")
                    }
                    it("constructs TimeLine instance") {
                        let expected = TweetFake.validTimeLine()
                        expect { try decoder.decode([Tweet].self, from: jsonData) }.to(equal(expected))
                    }
                }
                
                context("missing key") {
                    beforeEach {
                        jsonData = TweetFake.data(forJson: "timeLine-invalid")
                    }
                    
                    it("throws error") {
                        expect { try decoder.decode([Tweet].self, from: jsonData) }.to(throwError())
                    }
                }
            }
        }
        
        
    }
}
