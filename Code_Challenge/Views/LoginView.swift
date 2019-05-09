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
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0).isActive = true
        return button
    }()
    
    let usernameTextField: UITextField = {
       let textfield = UITextField()
       textfield.translatesAutoresizingMaskIntoConstraints = false
       textfield.placeholder = "Username"
       textfield.backgroundColor = .white
       textfield.layer.cornerRadius = 15
       NSLayoutConstraint(item: textfield, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant:40.0).isActive = true
       return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.placeholder = "Password"
        textfield.layer.cornerRadius = 15
        NSLayoutConstraint(item: textfield, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0).isActive = true
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    let twitterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "twitterLogin")
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    lazy var infoStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [ usernameTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
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
        addSubview(twitterImageView)
        addSubview(infoStackView)
        
        twitterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        twitterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        twitterImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        twitterImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60.0).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
    }
}
