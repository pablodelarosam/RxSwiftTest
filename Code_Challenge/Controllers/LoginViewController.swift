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
        
  
        setupView()
        bindUI()


    }


    override func viewDidAppear(_ animated: Bool) {
        
        
        TwitterClient.shared.isLoggedIn.observeNext { (isLoggedIn: Bool) -> Void in /* handle logged in status change */
            if isLoggedIn {
                print("Listening")
                self.present(self.tweetFeedControler, animated: true, completion: nil)
            }
        }

    }
    
    private func bindUI() {
        loginView.loginButton.rx.tap.bind {
            if let userName = self.loginView.usernameTextField.text, let password = self.loginView.passwordTextField.text {
                TwitterClient.shared.logIn(username: userName , password: password)
            }
        }

    }
    
    func setupView() {
        view.addSubview(loginView)
        loginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
