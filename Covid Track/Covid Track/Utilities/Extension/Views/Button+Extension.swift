//
//  Button+Extension.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit


extension UIButton{
  func roundedFilled(by cornerRadius:CGFloat, with backgroundColor:UIColor, and tintColor:UIColor){
    self.layer.cornerRadius = cornerRadius
    self.layer.masksToBounds = true
    self.backgroundColor = backgroundColor
    self.tintColor = tintColor
  }
  
}
