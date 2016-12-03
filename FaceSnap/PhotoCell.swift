//
//  PhotoCell.swift
//  FaceSnap
//
//  Created by Daval Cato on 10/29/16.
//  Copyright © 2016 Me2 Software. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let reuseIdentifier = "\(PhotoCell.self)"
    
    let imageView = UIImageView()
    
    
    override func layoutSubviews() {
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
























