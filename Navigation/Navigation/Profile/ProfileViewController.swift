//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    var profile = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.navigationItem.title = "ПРОФИЛЬ"
        view.addSubview(profile)
    }
    override func viewWillLayoutSubviews() {
        profile.frame = view.frame

    }

}
