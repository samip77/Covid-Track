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
  
  var name:String? {
    return visitModel.visitor?.name
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
  
  var temperatureColor: UIColor {
    let tempLevel = TemperatureLevel(rawValue: visitModel.temperatureLevel ?? 0)
    return tempLevel?.color ?? .black
  }
  
  var arrival: String? {
    if let date = visitModel.checkIn {
      return readableTimeFrom(date: date)
    }
    return nil
  }
  
  var departure: String? {
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
}
