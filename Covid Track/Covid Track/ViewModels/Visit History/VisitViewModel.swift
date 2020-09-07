//
//  VisitViewModel.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitViewModel {
  private let visitModel: VisitModel
  
  var profile: UIImage? {
    if let data = visitModel.visitor?.profile{
      return UIImage(data: data)
    }
    return nil
  }
  
  var name: String? {
    visitModel.visitor?.name
  }
  
  var email: String? {
    visitModel.visitor?.email
  }
  
  var phone: String? {
    visitModel.visitor?.phone
  }
  
  var home: String? {
    visitModel.visitor?.homeAddress
  }
  
  var work: String? {
    visitModel.visitor?.workAddress
  }
  
  var temperatureLevel: String {
    print(visitModel.temperatureLevel)
    let tempLevel = TemperatureLevel(rawValue:  visitModel.temperatureLevel )
    switch tempLevel {
    case .normal:
      return "Normal"
      
    case .high:
      return "High"
      
    case .danger:
      return "Danger"
      
    default:
      return "NA"
    }
  }
  
  var temperatureDescription: String? {
    let temperature = TemperatureLevel(rawValue: visitModel.temperatureLevel)
    return temperature?.description
  }
  
  var temperatureColor: UIColor {
    let tempLevel = TemperatureLevel(rawValue: visitModel.temperatureLevel )
    return tempLevel?.color ?? .black
  }
  
  var checkInTime: String? {
    if let date = visitModel.checkIn {
      return readableTimeFrom(date: date)
    }
    return nil
  }
  
  var checkInTimeDescription: String? {
    if let date = visitModel.checkIn{
      return getTimeDescription(date: date)
    }
    return nil
  }
  
  var checkOutTime: String? {
    if let date = visitModel.checkOut {
      return readableTimeFrom(date: date)
    }
    return nil
  }
  
  init(_ visitModel: VisitModel) {
    self.visitModel = visitModel
  }
  
  private func readableTimeFrom(date: Date) -> String{
    let timeInterval = Date().timeIntervalSince(date)
    var description = ""
   
    let second = 1.0
    let min = 60 * second
    let hour = 60 * min
    let day = 24 * hour
    let year = 365 * day
    
    if timeInterval < min {
      description =  "\(Int(timeInterval)) seconds ago"
    } else  if timeInterval < hour {
      description = "\(Int(timeInterval / min)) mins ago"
    }else if timeInterval < day {
      description = "\(Int(timeInterval / hour)) hours ago"
    }else if timeInterval < year {
      description = "\(Int(timeInterval / day)) days ago"
    }else {
      let days = Int(timeInterval / year)
      let unit = days > 1 ? "years ago" : "year ago"
      description = "\(timeInterval / day) \(unit)"
    }
    return description
  }
  
  func getTimeDescription(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm yyyy/MM/dd "
    return formatter.string(from: date)
  }
}
