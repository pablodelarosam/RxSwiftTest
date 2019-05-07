//
//  LoginViewController.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/5/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        return LoginView()
    }()
    
    let tweetFeedControler = UINavigationController(rootViewController: TweetFeedViewController())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bindUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TwitterClient.shared.isLoggedIn.observeNext { (isLoggedIn: Bool) -> Void in /* handle logged in status change */
            if isLoggedIn {
                self.present(self.tweetFeedControler, animated: true, completion: nil)
            }
        }
    }
    
    private func bindUI() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton(sender:)) , for: .touchUpInside)
        print(TwitterClient.shared.isLoggedIn.value)
    }
    
    override func loadView() {
        view = loginView
    }
    
    @objc func didTapLoginButton(sender: AnyObject) {
        self.present(tweetFeedControler, animated: true, completion: nil)
        if let userName = loginView.usernameTextField.text, let password = loginView.passwordTextField.text {
            TwitterClient.shared.logIn(username: userName , password: password)
        }
  
    }
    

}
