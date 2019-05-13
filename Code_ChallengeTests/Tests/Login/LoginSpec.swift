//
//  LoginSpec.swift
//  Code_ChallengeTests
//
//  Created by Pablo de la Rosa Michicol on 5/12/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

@testable import Code_Challenge
import Nimble
import Quick

class LoginSpec: QuickSpec {}

// MARK: - Tests
extension LoginSpec {
    override func spec()
    {
        var subject: TwitterClient!
        beforeEach { subject = .shared }
        describe("valid login") {
            context("when a valid login is entered") {
                beforeEach { subject.logIn(username: "Joor", password: "joor") }
                
                it("sets isLoggedIn.value = `true`") {
                    expect(subject.isLoggedIn.value).to(beTrue())
                }
            }
            
            context("when an invalid login is entered") {
                beforeEach { subject.logIn(username: "Joor", password: "jooor") }
                
                it("does nothing") {
                    expect(subject.isLoggedIn.value).to(beTrue())
                }
            }
        }
        
        
    }
}
