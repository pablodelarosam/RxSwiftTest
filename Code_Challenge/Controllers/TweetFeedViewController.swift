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

    // MARK: - Instance Properties
    internal var tweetViewModels: [TweetFeedViewModel] = []
    private let tableView = UITableView()
    private let  disposeBag = DisposeBag()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buildUI()
        setUpTweetTableView()
        fillTweets()
    }
    
    private func setUpTweetTableView() {
        view.addSubview(tableView)
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationItem.hidesBackButton = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
            ])
    }
    
    private func fillTweets() {
        let timeLine = TwitterClient.shared.loadTimeline()
        tweetViewModels = timeLine.map{ TweetFeedViewModel(tweet: $0) }
        let tweets = Observable.just(tweetViewModels)
        tableView.register(TweetCellTableViewCell.self, forCellReuseIdentifier: "cell")
        tweets.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
            model.configure(cell as! TweetViewModelView)
            }.disposed(by: disposeBag)
    }
    
    private func buildUI() {
        view.backgroundColor = .white
        let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        self.navigationItem.rightBarButtonItem = rightButton
        print(TwitterClient.shared)
    }
    
    @objc private func logout() {
        TwitterClient.shared.logOut()
        self.navigationController?.popViewController(animated: false)
    }
}
