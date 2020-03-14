//
//  TrackListViewCell.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import UIKit

class TrackListViewCell: UICollectionViewCell {
    
    let albumName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.textColor = UIColor.darkGray
        label.text = "--"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let artistName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.darkGray
        label.text = "--"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let albumCoverPic: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "Music")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension TrackListViewCell {
    
    func setupUI() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
    }

    func addViews() {
        addSubview(albumCoverPic)
        addSubview(albumName)
        addSubview(artistName)

        albumCoverPic.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        albumCoverPic.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        albumCoverPic.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        albumCoverPic.widthAnchor.constraint(equalToConstant: 130).isActive = true
        albumCoverPic.heightAnchor.constraint(equalToConstant: 80).isActive = true

        albumName.leadingAnchor.constraint(equalTo: albumCoverPic.trailingAnchor, constant: 8).isActive = true
        albumName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        albumName.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true

        artistName.leadingAnchor.constraint(equalTo: albumName.leadingAnchor).isActive = true
        artistName.trailingAnchor.constraint(equalTo: albumName.trailingAnchor).isActive = true
        artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 8).isActive = true
        artistName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
