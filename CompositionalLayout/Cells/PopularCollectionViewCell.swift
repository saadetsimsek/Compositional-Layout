//
//  PopularCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 23/09/2024.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "PopularCollectionViewCell"
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = UIColor.red.cgColor
            }
            else{
                layer.borderWidth = 0
            }
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(categoryLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(categoryName: String, imageName: String){
        categoryLabel.text = categoryName
        imageView.image = UIImage(named: imageName)
        
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5)
        ])
    }
    
    
}
