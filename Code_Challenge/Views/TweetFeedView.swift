//
//  TweetFeedView.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/6/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import Foundation
import UIKit

class TweetFeedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commitInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(hex: "#65bbf2")

    }
    

}

