//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    var profile = ProfileHeaderView()
    var button: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("Новая кнопка", for: .normal)
        newButton.backgroundColor = .systemBlue
        newButton.layer.cornerRadius = 12
        newButton.layer.borderWidth = 1
        newButton.layer.borderColor = CGColor(gray: 10, alpha: 10)
        return newButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.navigationItem.title = "ПРОФИЛЬ"
        profileConstrains()
        buttonConstrains()
    }
    func profileConstrains() {
        view.addSubview(profile)
        profile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        profile.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        profile.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        profile.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func buttonConstrains() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewWillLayoutSubviews() {
    }
}
