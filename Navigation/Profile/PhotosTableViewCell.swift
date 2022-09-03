//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.07.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let numberOfLine: CGFloat = 4
    }
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var nameTable: UILabel = {
        var name = UILabel()
        name.text = "Photos"
        name.textColor = .black
        name.font = .systemFont(ofSize: 24, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var rightArrow: UIImageView = {
        var right = UIImageView()
        right.image = UIImage(systemName: "arrow.right")
        right.tintColor = .black
        right.translatesAutoresizingMaskIntoConstraints = false
        return right
    }()
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        tableViewCellConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableViewCellConstrains() {
        contentView.addSubview(nameTable)
        contentView.addSubview(rightArrow)
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            nameTable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            rightArrow.centerYAnchor.constraint(equalTo: nameTable.centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            collectionView.topAnchor.constraint(equalTo: nameTable.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.fillCell(photo: photosCollection[indexPath.row])
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 6
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        
        let needed = collectionView.frame.width - (Constants.numberOfLine - 1) * spacing - insets.left - insets.right
        
        let itemWidth = floor(needed / Constants.numberOfLine)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
