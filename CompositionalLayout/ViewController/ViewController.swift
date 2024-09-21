//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Saadet Şimşek on 10/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Make an order", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Food Shop"
        view.addSubview(orderButton)
        
        setConstraits()
        
    }
    
    private func setConstraits(){
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            orderButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }


}

