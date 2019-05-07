//
//  LoginView.swift
//  Code_Challenge
//
//  Created by Pablo de la Rosa Michicol on 5/5/19.
//  Copyright © 2019 JOOR. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44.0).isActive = true
        return button
    }()
    
    let usernameTextField: UITextField = {
       let textfield = UITextField()
       textfield.translatesAutoresizingMaskIntoConstraints = false
       textfield.placeholder = "Username"
       textfield.backgroundColor = .white
       textfield.layer.cornerRadius = 15
       NSLayoutConstraint(item: textfield, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44.0).isActive = true
       return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.placeholder = "Password"
        textfield.layer.cornerRadius = 15
        NSLayoutConstraint(item: textfield, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44.0).isActive = true
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    let twitterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "twitterLogin")
        NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0).isActive = true
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [twitterImageView, usernameTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 5
       return stackView
    }()
    
    lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoStackView, loginButton ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commitInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(hex: "#65bbf2")
        
        addSubview(loginStackView)
        readableContentGuide.topAnchor.constraint(equalTo: loginStackView.topAnchor, constant: -60.0).isActive = true
        readableContentGuide.bottomAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 20.0).isActive = true
        readableContentGuide.leadingAnchor.constraint(equalTo: loginStackView.leadingAnchor, constant: -20.0).isActive = true
        readableContentGuide.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor, constant: 20.0).isActive = true
    }
    
    
}
