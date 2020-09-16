//
//  TableViewCell+Extension.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

protocol ReusableView {
  static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var reuseIdentifier: String {
    return NSStringFromClass(self)
  }
}

extension UITableViewCell:  ReusableView { }

extension UICollectionViewCell: ReusableView { }
