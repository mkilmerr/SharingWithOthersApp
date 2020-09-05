//
//  SharingView.swift
//  SharingWithOtherApps
//
//  Created by Marcos Kilmer on 05/09/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class SharingView: UIView {
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Share a message"
        text.layer.cornerRadius = 4
        text.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Share Message", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var shareImage: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sd_setImage(with: URL(string: "https://picsum.photos/seed/picsum/200/300"), completed: nil)
        return image
    }()
    
    lazy var shareButtonImage: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Share Image", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- SETUP UI COMPONENTS

extension SharingView {
    func setupComponents(){
        addSubview(textField)
        addSubview(shareButton)
        addSubview(shareImage)
        addSubview(shareButtonImage)
    }
}

//MARK:- SETUP CONSTRAINTS

extension SharingView {
    func setupConstraints(){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shareImage.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 20),
            shareImage.widthAnchor.constraint(greaterThanOrEqualToConstant: 300),
            shareImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            shareImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shareButtonImage.topAnchor.constraint(equalTo: shareImage.bottomAnchor, constant: 20),
            shareButtonImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
