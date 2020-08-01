//
//  VisitRecordViewController+TemperaturePicker.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

enum TemperatureLevel:Int, CaseIterable{
  case normal
  case high
  case danger
  
  var description: String {
    switch self {
    case .normal:
      return "Less than equal to 37 degree"
      
    case .high:
      return "More than 37 and less than 37.5 degree"
      
    case .danger:
      return  "Greater than equal to 37.5 degree"
    }
  }
  
  var color: UIColor {
    switch self {
    case .high:
      return .orange
      
    case .danger:
      return .red
      
    default:
      return .black
    }
  }
}

//MARK:- Temperature Picker
extension VisitRecordViewController:UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return TemperatureLevel.allCases.count
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let label = UILabel.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: pickerView.frame.width, height: 40)))
    label.font = AppConstants.Font.button
    label.text = TemperatureLevel.allCases[row].description
    return label
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerView.reloadAllComponents()
  }
}

extension VisitRecordViewController:UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else {
      return
    }
    //label.backgroundColor = backgroundColors[row]
    label.textColor = TemperatureLevel.allCases[row].color
    
  }
}
