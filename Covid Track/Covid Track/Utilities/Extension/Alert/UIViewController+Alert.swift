//
//  UIViewController+Alert.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

extension UIViewController {
  func showActionAlert(with title: String, and message: String, in target: UIViewController?,action selector: Selector?){
    let alert = UIAlertController(title: title, message: message,
                                  preferredStyle: .actionSheet)
    let action = UIAlertAction(title: "Try Again", style: .default) { (action) in
      if let selector = selector, let target = target{
         target.performSelector(onMainThread: selector, with: nil, waitUntilDone: false)
      }
    }
    let cancel = UIAlertAction(title: "Cancel", style: .destructive)
    alert.addAction(action)
    alert.addAction(cancel)
    present(alert, animated: true)
  }
  
  func showAlert(with title: String, and message: String, preferredStyle: UIAlertController.Style = .actionSheet){
    let alert = UIAlertController(title: title, message: message,
                                     preferredStyle:preferredStyle)
       let cancel = UIAlertAction(title: "Done", style: .destructive)
       alert.addAction(cancel)
       present(alert, animated: true)
  }
}
