//
//  StoriesCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 23/09/2024.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoriesCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "salesBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubview(imageView)
        addConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(imageName: String){
        imageView.image = UIImage(named: imageName)
    }
    
    private func addConstraits(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
}
