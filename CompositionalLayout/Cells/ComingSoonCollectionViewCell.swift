//
//  ComingSoonCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 23/09/2024.
//

import UIKit

class ComingSoonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ComingSoonCollectionViewCell"
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "burger1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Egg Top Burger"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$7.42"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        backgroundColor = .systemBackground
        addSubview(burgerImageView)
        addSubview(backgroundTitleView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(imageName: String){
        burgerImageView.image = UIImage(named: imageName)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            burgerImageView.topAnchor.constraint(equalTo: topAnchor),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10)
        ])
    }
}
