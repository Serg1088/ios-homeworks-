//
//  PostViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "ПОСТ"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.navigationItem.title = titlePost
        let barButton = UIBarButtonItem(barButtonSystemItem:.organize, target: self, action: #selector(tapButton))
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func tapButton() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil) // модально
    }
}
