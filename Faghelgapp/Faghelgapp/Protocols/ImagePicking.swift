//
//  ImagePicking.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 10/11/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePicking {
    associatedtype T
    var viewController: T! { get }

    func openImagePicker(sourceType: UIImagePickerControllerSourceType)
}

extension ImagePicking where T: UIViewController, T: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func openImagePicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = viewController
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType

        viewController.present(imagePicker, animated: false)
    }
}
