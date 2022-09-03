//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Белкин on 06.06.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {
    var avatarImageView: UIImageView = {
        let avatar = UIImageView()
//        avatar.image = UIImage(named: "ava")
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(gray: 5, alpha: 5)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    lazy var fullNameLAbel: UILabel = {
        let nick = UILabel()
//        nick.text = "BelkinSK"
        nick.textColor = .black
        nick.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nick.translatesAutoresizingMaskIntoConstraints = false
        return nick
    }()
    lazy var statusLabel: UILabel = {
        let status = UILabel()
//        status.text = "Waiting for something..."
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var setStatusButton: UIButton = {
        var statsuButton = UIButton()
        statsuButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        statsuButton.clipsToBounds = true
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
    

    let user = CurrentUserService()
    let userTest = TestUserService()

    
  
    
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        setupView()
        userSetup()
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
        NSLayoutConstraint.activate([
        avatarImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
        avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(fullNameLAbel)
        NSLayoutConstraint.activate([
        fullNameLAbel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
        fullNameLAbel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
        fullNameLAbel.widthAnchor.constraint(equalToConstant: 100)
        ])
       
        
        addSubview(statusLabel)
        NSLayoutConstraint.activate([
        statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
        statusLabel.topAnchor.constraint(equalTo: fullNameLAbel.bottomAnchor, constant: 27)
        ])
       
        
        addSubview(setStatusButton)
        NSLayoutConstraint.activate([
        setStatusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 12),
        setStatusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -12),
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        addSubview(statusTextField)
        NSLayoutConstraint.activate([
        statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 12),
        statusTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -12),
        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
        statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
       
    }

    private func userSetup() {
#if DEBUG
        avatarImageView.image = userTest.userTest.avatar
        statusLabel.text = userTest.userTest.status
        fullNameLAbel.text = userTest.userTest.fullName
#else
        avatarImageView.image = user.userLogin.avatar
        statusLabel.text = user.userLogin.status
        fullNameLAbel.text = user.userLogin.fullName
#endif
    }
    @objc func buttonPressed() {
        print(statusLabel.text!)
    }
    
}


