//
//  VisitHistoryTableViewCell.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitHistoryTableViewCell: UITableViewCell, NibLoadableView {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var checkInLabel: UILabel!
  @IBOutlet weak var checkOutLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
  
  private func setupView() {
    nameLabel.font = AppConstants.Font.cellTitle
    temperatureLabel.font = AppConstants.Font.cellTitle
    checkInLabel.font = AppConstants.Font.cellSubtitle
    checkOutLabel.font = AppConstants.Font.cellSubtitle
    
    profileImageView.layer.cornerRadius = 20
    profileImageView.layer.masksToBounds = true
  }
  
  func configure(with viewModel:VisitViewModel){
    nameLabel.text = viewModel.name
    temperatureLabel.text = viewModel.temperatureLevel
    temperatureLabel.textColor = viewModel.temperatureColor
    checkInLabel.text = viewModel.arrival
    checkOutLabel.text = viewModel.departure
  }
    
}
