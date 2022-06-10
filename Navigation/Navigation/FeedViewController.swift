//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "ПОСТ")
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 400, width: 200, height: 100))
            button.backgroundColor = .blue
            button.layer.cornerRadius = 12
            button.setTitle("ПОСТ", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.title = "ЛЕНТА"
        self.view.addSubview(self.button)
        self.button.clipsToBounds = true
    }
    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
}
