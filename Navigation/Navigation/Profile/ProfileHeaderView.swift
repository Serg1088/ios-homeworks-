//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Белкин on 06.06.2022.
//

import UIKit

final class ProfileHeaderView: UIView {
    private lazy var avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "ava")
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(gray: 5, alpha: 5)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    private lazy var fullNameLAbel: UILabel = {
        let nick = UILabel()
        nick.text = "Serg Belkin"
        nick.textColor = .black
        nick.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nick.translatesAutoresizingMaskIntoConstraints = false
        return nick
    }()
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var setStatusButton: UIButton = {
        var statsuButton = UIButton()
        statsuButton.backgroundColor = .systemBlue
        statsuButton.setTitle("Set Status", for: .normal)
        statsuButton.layer.shadowColor = UIColor.black.cgColor
        statsuButton.layer.shadowRadius = statsuButton.frame.height / 4
        statsuButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statsuButton.layer.shadowOpacity = 0.7
        statsuButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        statsuButton.translatesAutoresizingMaskIntoConstraints = false
        return statsuButton
    }()
    
    var statusTextField: UITextField = {
        var textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 12
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = CGColor(genericCMYKCyan: 10, magenta: 10, yellow: 10, black: 10, alpha: 10)
        textfield.textColor = .black
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        setStatusButton.layer.cornerRadius = setStatusButton.frame.height / 4
    }
    
    private func setupView () {
        addSubview(avatarImageView)
        avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(fullNameLAbel)
        fullNameLAbel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
        fullNameLAbel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        fullNameLAbel.widthAnchor.constraint(equalToConstant: 100).isActive = true
       
        
        addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
        statusLabel.topAnchor.constraint(equalTo: fullNameLAbel.bottomAnchor, constant: 27).isActive = true
        
        
        addSubview(setStatusButton)
        setStatusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        setStatusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(statusTextField)
        statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16).isActive = true
        statusTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    @objc func buttonPressed() {
        print(statusLabel.text!)
    }
    
}
