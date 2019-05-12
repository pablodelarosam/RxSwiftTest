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
    let tweetFeedControler =  TweetFeedViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
  
        setupView()
        bindUI()
        handleLogin()
    }
    
    private func handleLogin() {
        TwitterClient.shared.isLoggedIn.observeNext { (isLoggedIn: Bool) -> Void in
            if isLoggedIn {
                self.navigationController?.pushViewController(self.tweetFeedControler, animated: true)
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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        loginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
