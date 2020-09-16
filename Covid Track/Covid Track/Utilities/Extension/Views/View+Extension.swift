//
//  View.swift
//  Covid Track
//
//  Created by Samip shah on 2/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

extension UIView {
  func rounded(by cornerRadius:CGFloat) {
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = true
  }
  
  func rounded() {
    let radius = frame.size.width < frame.size.height ? frame.size.width/2 : frame.size.height/2
    rounded(by: radius)
  }
}
