//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сергей Белкин on 06.06.2022.
//

import UIKit

final class ProfileHeaderView: UIView {
    private lazy var avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "ava")
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(gray: 5, alpha: 5)
        return avatar
    }()
    private lazy var lableNick: UILabel = {
        let nick = UILabel()
        nick.text = "Serg Belkin"
        nick.textColor = .black
        nick.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return nick
    }()
    private lazy var textStatus: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return status
    }()
    
    private lazy var showStatus: UIButton = {
        var showButton = UIButton()
        showButton.backgroundColor = .blue
        showButton.setTitle("Show Status", for: .normal)
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowRadius = showButton.frame.height / 4
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.shadowOpacity = 0.7
        showButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        return showButton
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
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        showStatus.layer.cornerRadius = showStatus.frame.height / 4
    }
    
    private func setupView () {
        addSubview(avatarImage)
        addSubview(lableNick)
        addSubview(textStatus)
        addSubview(showStatus)
        avatarImage.frame = CGRect(x: 16, y: 100, width: 100, height: 100)
        lableNick.frame = CGRect(x: 132, y: 75, width: 100, height: 100)
        textStatus.frame = CGRect(x: 132, y: 120, width: 200, height: 100)
        showStatus.frame = CGRect(x: 16, y: 220, width: 384, height: 50)
    }
    @objc func buttonPressed() {
        print(textStatus.text!)
    }
    
}
