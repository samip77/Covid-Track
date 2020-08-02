//
//  StoryboardHelper.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import UIKit


extension UIStoryboard {
  
  enum Storyboard: String {
    //TODO: Add new storyboards name if applicable.
    case visit = "Visit"
  }
  
  convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
    self.init(name: storyboard.rawValue, bundle: bundle)
  }
  
  class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
    return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
  }
  
  /// Returns the UIViewController from storyboard with identifier same as class name
  func instantiateViewController<T: UIViewController>() -> T {
    guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
      fatalError("\n\nCould not find view controller with name \(T.storyboardIdentifier)\n\n")
    }
    
    return viewController
  }
}
