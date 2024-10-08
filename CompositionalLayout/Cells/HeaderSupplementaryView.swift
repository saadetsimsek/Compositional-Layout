//
//  HeaderSupplementaryView.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 25/09/2024.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    static let identifier = "HeaderSupplementaryView"
        
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(headerLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureHeader(categoryName: String){
        headerLabel.text = categoryName
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
