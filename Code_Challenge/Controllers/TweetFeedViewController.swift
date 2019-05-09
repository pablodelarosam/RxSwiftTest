//
//  TweetFeedViewController.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/7/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TweetFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buildUI()
        print(TwitterClient.shared.loadTimeline())
    }
    
    private func buildUI() {
        view.backgroundColor = .white
        let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        self.navigationItem.rightBarButtonItem = rightButton
        print(TwitterClient.shared)
    }
    
    @objc func logout() {
        TwitterClient.shared.logOut()
        self.present(LoginViewController(), animated: true, completion: nil)
        print("It Works")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
