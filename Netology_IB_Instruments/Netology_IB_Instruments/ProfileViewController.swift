//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Сергей Белкин on 22.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        let screenHeigdth = UIScreen.main.bounds.height
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {profileView.frame = CGRect(x: 20, y: 40, width: screenWidth - 40, height: screenHeigdth - 80)
        view.addSubview(profileView)
        }
    }
}
