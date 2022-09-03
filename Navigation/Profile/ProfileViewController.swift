//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.06.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    private let user: User
    
    var startpoint: CGPoint?
    
    private lazy var avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.image = user.avatar
        avatar.alpha = 0
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(gray: 5, alpha: 5)
        avatar.layer.cornerRadius = 50
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.alpha = 0
        backView.backgroundColor = .black
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    private lazy var cancelButton: UIImageView = {
        let cancel = UIImageView()
        cancel.image = UIImage(systemName: "delete.backward")
        cancel.isUserInteractionEnabled = true
        cancel.translatesAutoresizingMaskIntoConstraints = false
        return cancel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style:.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(user:User) {
            self.user = user
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConstrains()
        constrainsForAnimation()
        setupTapCancel()
#if DEBUG
        self.tableView.backgroundColor = .systemGray5
#else
        self.tableView.backgroundColor = .systemBackground
#endif
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        startpoint = self.avatarImageView.center
        
    }

    private func tableViewConstrains(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    private func constrainsForAnimation() {
        view.addSubview(backView)
        view.addSubview(avatarImageView)
        backView.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cancelButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTapCancel() {
        let tapCancel = UITapGestureRecognizer(target: self, action: #selector(tapCancelButton))
        cancelButton.addGestureRecognizer(tapCancel)
    }
    
    @objc func tapAnimationAvatar (_ gesture: UIGestureRecognizer) {
        print("Тап работает")
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .allowUserInteraction) {
            self.avatarImageView.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
            self.avatarImageView.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
            self.avatarImageView.alpha = 1.0
            self.backView.alpha = 0.2
        }
    }
    
    @objc func tapCancelButton() {
        print("Закрыть")
      
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveEaseInOut) {
            self.avatarImageView.center = self.startpoint ?? CGPoint(x: 0, y: 0)
            self.avatarImageView.transform = .identity
        } completion: { _ in
            self.backView.alpha = 0
            self.avatarImageView.alpha = 0
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : arrayPosts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPost = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let cellPhotos = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
        cellPost.setup(with: arrayPosts[indexPath.row])
        return indexPath.section == 0 ? cellPhotos : cellPost
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView else { return nil }
            let tapAnimationAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAnimationAvatar(_:)))
            header.avatarImageView.addGestureRecognizer(tapAnimationAvatarGesture)
            header.avatarImageView.isUserInteractionEnabled = true
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? UITableView.automaticDimension : 0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let photoGallery = PhotosViewController()
        photoGallery.title = "Photo Gallery"
        indexPath.section == 0 ? navigationController?.pushViewController(photoGallery, animated: true) : nil
    }
}
