//
//  ImagePicker.swift
//  Covid Track
//
//  Created by Samip shah on 31/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

public protocol ImagePickerDelegate: class {
  func didSelect(image: UIImage?, imageUrl: URL?)
}

open class ImagePicker: NSObject {
  private let pickerController: UIImagePickerController
  private weak var presentationController: UIViewController?
  private weak var delegate: ImagePickerDelegate?
  
  public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
    pickerController = UIImagePickerController()
    
    super.init()
    
    self.presentationController = presentationController
    self.delegate = delegate
    
    pickerController.delegate = self
    pickerController.allowsEditing = true
    pickerController.mediaTypes = ["public.image"]
  }
  
  private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
    guard UIImagePickerController.isSourceTypeAvailable(type) else {
      return nil
    }
    
    return UIAlertAction(title: title, style: .default) { [unowned self] _ in
      self.pickerController.sourceType = type
      self.presentationController?.present(self.pickerController, animated: true)
    }
  }
  
  public func present(from sourceView: UIView) {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    if let action = self.action(for: .camera, title: "Take photo") {
      alertController.addAction(action)
    }
    if let action = self.action(for: .savedPhotosAlbum, title: "Take picture") {
      alertController.addAction(action)
    }
    if let action = self.action(for: .photoLibrary, title: "Upload form library") {
      alertController.addAction(action)
    }
    
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    if UIDevice.current.userInterfaceIdiom == .pad {
      alertController.popoverPresentationController?.sourceView = sourceView
      alertController.popoverPresentationController?.sourceRect = sourceView.bounds
      alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
    }
    
    presentationController?.present(alertController, animated: true)
  }
  
  private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?, with imageUrl: URL?) {
    controller.dismiss(animated: true, completion: nil)
    delegate?.didSelect(image: image, imageUrl: imageUrl)
  }
}

extension ImagePicker: UIImagePickerControllerDelegate {
  public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    pickerController(picker, didSelect: nil, with: nil)
  }
  
  public func imagePickerController(_ picker: UIImagePickerController,
                                    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let image = info[.editedImage] as? UIImage, let url = info[.imageURL] as? URL else {
      return pickerController(picker, didSelect: nil, with: nil)
    }
   
    pickerController(picker, didSelect: image, with: url)
  }
}

extension ImagePicker: UINavigationControllerDelegate { }

