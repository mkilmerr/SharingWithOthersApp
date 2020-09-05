//
//  SharingViewController.swift
//  SharingWithOtherApps
//
//  Created by Marcos Kilmer on 05/09/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class SharingViewController: UIViewController {
    let sharingView = SharingView()
    
    override func loadView() {
        view = sharingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sharingView.textField.delegate = self
        self.sharingView.shareButton.addTarget(self, action: #selector(shareDidTapped), for: .touchUpInside)
        self.sharingView.shareButtonImage.addTarget(self, action: #selector(shareButtonImageDidTapped), for: .touchUpInside)
        
    }
    
}

//MARK:- TEXT FIELD METHODS

extension SharingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
//MARK:- BUTTON TARGETS

extension SharingViewController {
    
    @objc func shareDidTapped() {
        guard let text = self.sharingView.textField.text else {return }
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController,animated: true, completion: nil)
        
    }
    
    @objc func shareButtonImageDidTapped() {
        guard let shareImage = self.sharingView.shareImage.image else {return}
        let activityController = UIActivityViewController(activityItems: [shareImage], applicationActivities: nil)
        present(activityController,animated: true, completion: nil)
    }
}
