//
//  NewMessageViewController.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol NewMessageViewControllerOutput {
    func publishButtonClicked(message: MessageInput)
}

class NewMessageViewController: UIViewController {
    var interactor: NewMessageViewControllerOutput!
    var router: NewMessageRouterInput!

    @IBOutlet weak var newMessageView: NewMessageView!

    override func viewDidLoad() {
        newMessageView.delegate = self
        NewMessageConfigurator.sharedInstance.configure(viewController: self)
    }
}

extension NewMessageViewController: NewMessageViewDelegate {
    func cameraButtonClicked() {
        router.openImagePicker(sourceType: .camera)
    }

    func galleryButtonClicked() {
        router.openImagePicker(sourceType: .photoLibrary)
    }

    func publishButtonClicked(message: MessageInput) {
        interactor.publishButtonClicked(message: message)
    }
}

extension NewMessageViewController: NewMessagePresenterOutput {
    func messagePostedSuccessfully() {
        router.navigateBackToFeed()
    }

    func failedToPostMessage() {
        newMessageView.enableButtons()
    }
}

extension NewMessageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        self.dismiss(animated: false, completion: nil)

        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newMessageView.set(image: pickedImage)
        }
    }
}
