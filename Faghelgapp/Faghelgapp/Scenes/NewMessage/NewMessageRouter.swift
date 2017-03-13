//
//  NewMessageRouter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation


protocol NewMessageRouterInput {
    func navigateBackToFeed()
    func openImagePicker(sourceType: UIImagePickerControllerSourceType)
}

class NewMessageRouter: NewMessageRouterInput, ImagePicking {
    typealias T = NewMessageViewController
    internal weak var viewController: NewMessageViewController!
    
    func navigateBackToFeed() {
        let _ = viewController.navigationController?.popViewController(animated: false)
    }
}