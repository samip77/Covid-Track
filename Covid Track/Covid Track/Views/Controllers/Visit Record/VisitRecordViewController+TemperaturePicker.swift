//
//  VisitRecordViewController+TemperaturePicker.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

extension VisitRecordViewController:UIPickerViewDataSource {
  private var temperatureLevels: [String]{
    return ["Less than equal to 37 degree", "More than 37 and less than 37.5 degree", "Greater than equal to 37.5 degree"]
  }
  
  private var backgroundColors: [UIColor] {
    return [.black, .orange, .red]
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return temperatureLevels.count
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let label = UILabel.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: pickerView.frame.width, height: 40)))
    label.font = AppConstants.Font.button
    label.text = temperatureLevels[row]
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
    label.textColor = backgroundColors[row]
    print(temperatureLevels[row])
  }
}
