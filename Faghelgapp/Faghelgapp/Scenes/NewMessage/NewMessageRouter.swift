//
//  NewMessageRouter.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 25/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

protocol NewMessageRouterInput {
    func navigateBackToFeed()
    func openImagePicker(sourceType: UIImagePickerControllerSourceType)
}

class NewMessageRouter: NewMessageRouterInput, ImagePicking {
    typealias T = NewMessageViewController
    internal weak var viewController: NewMessageViewController!

    func navigateBackToFeed() {
        _ = viewController.navigationController?.popViewController(animated: false)
    }
}
