//
//  NewMessageView.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol NewMessageViewDelegate {
    func cameraButtonClicked()
    func galleryButtonClicked()
    func publishButtonClicked(message: MessageInput)
}

class NewMessageView: NibLoadingView {
    var delegate: NewMessageViewDelegate!
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var publishButton: UIButton!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        messageTextView.textColor = UIColor.mesanBlue
        messageTextView.font = UIFont.pFont()
        
        publishButton.titleLabel?.font = UIFont.pFont()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func set(image: UIImage) {
        imageViewHeightConstraint.constant = 150
        imageView.isHidden = false
        imageView.image = image
    }
    
    @IBAction func cameraButtonClicked(_ sender: UIButton) {
        delegate.cameraButtonClicked()
    }
    
    @IBAction func galleryButtonClicked(_ sender: UIButton) {
        delegate.galleryButtonClicked()
    }
    
    @IBAction func publishButtonClicked(_ sender: UIButton) {
        if !messageTextView.text.isEmpty {
            sender.isEnabled = false
            let message = MessageInput(title: "", content: messageTextView.text)
            delegate.publishButtonClicked(message: message)
        }
    }
}

extension NewMessageView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCharacterCount = textView.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + text.characters.count - range.length
        return newLength <= 140
    }
}
