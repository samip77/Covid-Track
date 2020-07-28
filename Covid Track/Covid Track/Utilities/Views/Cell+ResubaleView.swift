//
//  TableViewCell+Extension.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView {
  static var defaultResuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultResuseIdentifier: String {
    return NSStringFromClass(self)
  }
}

extension UITableViewCell:  ReusableView { }

extension UICollectionViewCell: ReusableView { }
