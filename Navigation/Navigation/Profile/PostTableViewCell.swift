//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Сергей Белкин on 27.06.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell{
    static var identifier: String = "postTableViewCell"
        
        private lazy var authorPost: UILabel = {
            let authorPost = UILabel()
            authorPost.font = .systemFont(ofSize: 20, weight: .bold)
            authorPost.textColor = .black
            authorPost.numberOfLines = 2
            authorPost.translatesAutoresizingMaskIntoConstraints = false
            return authorPost
        }()
        private lazy var imagePost: UIImageView = {
           let imagePost = UIImageView()
            imagePost.contentMode = .scaleAspectFit
            imagePost.backgroundColor = .black
            imagePost.translatesAutoresizingMaskIntoConstraints = false
            return imagePost
        }()
        
        private lazy var descriptionPost: UILabel = {
           let descriptionPost = UILabel()
            descriptionPost.font = .systemFont(ofSize: 14)
            descriptionPost.textColor = .systemGray
            descriptionPost.numberOfLines = 0
            descriptionPost.translatesAutoresizingMaskIntoConstraints = false
            return descriptionPost
        }()
        
        private lazy var likesPost: UILabel = {
           let likesLb = UILabel()
            likesLb.font = .systemFont(ofSize: 16)
            likesLb.text = "Likes:"
            likesLb.textColor = .black
            likesLb.translatesAutoresizingMaskIntoConstraints = false
            return likesLb
        }()
        
        private lazy var likesPostCount: UILabel = {
           let likesCount = UILabel()
            likesCount.font = .systemFont(ofSize: 16)
            likesCount.textColor = .black
            likesCount.translatesAutoresizingMaskIntoConstraints = false
            return likesCount
        }()
        
        private lazy var viewsPost: UILabel = {
           let views = UILabel()
            views.font = .systemFont(ofSize: 16)
            views.text = "Views:"
            views.textColor = .black
            views.translatesAutoresizingMaskIntoConstraints = false
            return views
        }()
        
        private lazy var viewsPostCount: UILabel = {
           let viewsCount = UILabel()
            viewsCount.font = .systemFont(ofSize: 16)
            viewsCount.textColor = .black
            viewsCount.translatesAutoresizingMaskIntoConstraints = false
            return viewsCount
        }()
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            tableViewCellConstrains()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func tableViewCellConstrains() {
            contentView.addSubview(authorPost)
            contentView.addSubview(imagePost)
            contentView.addSubview(descriptionPost)
            contentView.addSubview(likesPost)
            contentView.addSubview(likesPostCount)
            contentView.addSubview(viewsPost)
            contentView.addSubview(viewsPostCount)
            
            NSLayoutConstraint.activate([
                authorPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
                authorPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
                authorPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 16),
                
                imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor),
                imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imagePost.heightAnchor.constraint(equalToConstant: contentView.frame.width),
                imagePost.widthAnchor.constraint(equalToConstant: contentView.frame.width),
                
                descriptionPost.topAnchor.constraint(equalTo:imagePost.bottomAnchor,constant: 5),
                descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
                descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,constant: 5),
                likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
                likesPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                likesPostCount.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,constant: 5),
                likesPostCount.leadingAnchor.constraint(equalTo: likesPost.trailingAnchor, constant: 5),
                likesPostCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                viewsPostCount.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,constant: 5),
                viewsPostCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                viewsPostCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,constant: 5),
                viewsPost.trailingAnchor.constraint(equalTo: viewsPostCount.leadingAnchor,constant: -5),
                viewsPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                
            ])
        }
        
        func setup(with post: PostStruct) {
            authorPost.text = post.author
            imagePost.image = UIImage(named: post.image)
            descriptionPost.text = post.description
            likesPostCount.text = String(post.likes)
            viewsPostCount.text = String(post.views)
        }
        
}

