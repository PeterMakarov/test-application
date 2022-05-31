//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Петр Макаров on 20.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    weak var myCats: ProfileViewController?
    
    private let photos = Photo.makePhoto()
    
    private let whiteView: UIView = {
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    private let titlePhotos: UILabel = {
        let titlePhotos = UILabel()
        titlePhotos.translatesAutoresizingMaskIntoConstraints = false
        titlePhotos.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titlePhotos.textColor = .black
        titlePhotos.text = "Photos"
        return titlePhotos
    }()
    
    private let backLabel: UILabel = {
        let backLabel = UILabel()
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        backLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        backLabel.textColor = .black
        backLabel.text = "->"
        return backLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layoutCollectionView = UICollectionViewFlowLayout()
        layoutCollectionView.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutCollectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.contentMode = .scaleAspectFill
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        contentView.addSubview(whiteView)
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        
        [titlePhotos, backLabel,  collectionView].forEach{whiteView.addSubview($0)}
        
        //let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            titlePhotos.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            titlePhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            
            backLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            backLabel.centerYAnchor.constraint(equalTo: titlePhotos.centerYAnchor),
            backLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            collectionView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: inset),
            collectionView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
        ])
    }
}

// MARK: - UICollectionViewDataSource


extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(with: photos[indexPath.row])
        cell.layer.cornerRadius = 6
        cell.backgroundColor = .white
        cell.clipsToBounds = true
        return cell
    }
        
    }



// MARK: - UICollectionViewDelegate

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 12 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - inset * 4) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}
