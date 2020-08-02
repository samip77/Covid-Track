//
//  String+Extension.swift
//  Covid Track
//
//  Created by Samip shah on 2/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

extension String {
  var isValidEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: self)
  }
  
   var isValidPhone: Bool{
    let PHONE_REGEX = "^\\({0,1}((0|\\+61)(2|4|3|7|8)){0,1}\\){0,1}(\\ |-){0,1}[0-9]{2}(\\ |-){0,1}[0-9]{2}(\\ |-){0,1}[0-9]{1}(\\ |-){0,1}[0-9]{3}$"
    let phonePred = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    return phonePred.evaluate(with: self)
  }
}


