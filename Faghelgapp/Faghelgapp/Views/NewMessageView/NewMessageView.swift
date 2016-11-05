//
//  NewMessageView.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

protocol NewMessageViewDelegate {
    func publishButtonClicked(message: MessageInput)
}

class NewMessageView: NibLoadingView {
    var viewController: NewMessageViewDelegate!
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var publishButton: UIButton!
    
    override func awakeFromNib() {
        messageTextView.textColor = UIColor.mesanBlue
        messageTextView.font = UIFont.pFont()
        
        publishButton.titleLabel?.font = UIFont.pFont()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func publishButtonClicked(_ sender: UIButton) {
        if !messageTextView.text.isEmpty {
            sender.isEnabled = false
            let message = MessageInput(title: "", content: messageTextView.text)
            viewController.publishButtonClicked(message: message)
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
