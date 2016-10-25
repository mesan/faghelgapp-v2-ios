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
    
    override func awakeFromNib() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func publishButtonClicked(_ sender: UIButton) {
        let message = MessageInput(title: "", content: messageTextView.text)
        viewController.publishButtonClicked(message: message)
    }
}
