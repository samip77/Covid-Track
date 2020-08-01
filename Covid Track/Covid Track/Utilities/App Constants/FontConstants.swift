//
//  FontConstants.swift
//  Covid Track
//
//  Created by Samip shah on 31/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import UIKit

extension AppConstants{
  struct Font {
    static var title = UIFont.systemFont(ofSize: 24, weight: .heavy)
    
    static var subtitle = UIFont.systemFont(ofSize: 18, weight: .bold)
    
    static var body = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    static var button = UIFont.systemFont(ofSize: 18, weight: .medium)
    
    static var cellTitle = UIFont.systemFont(ofSize: 18, weight: .bold)
    static var cellSubtitle =  UIFont.systemFont(ofSize: 14, weight: .light)
  }
}
