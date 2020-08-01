//
//  VisitHistoryTableViewCell.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitHistoryTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
  
  func setupView() {
    nameLabel.font = AppConstants.Font.cellTitle
    temperatureLabel.font = AppConstants.Font.cellSubtitle
  }
    
}
