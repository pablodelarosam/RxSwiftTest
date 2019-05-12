//
//  TweetCellTableViewCell.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/11/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - TweetViewModelView
extension TweetCellTableViewCell: TweetViewModelView {
    
    public var tweetContentLabel: UILabel {
        return self.textLabel ?? UILabel()
    }
    
    public var tweetUserLabel: UILabel {
        return self.detailTextLabel ?? UILabel()
    }
}

