//
//  VisitRecordViewModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation


class VisitRecordViewModel {
  private let visitorRepository: VisitorRepository
  private let visitRepository: VisitRepository
  
  init(with visitorRepository: VisitorRepository = VisitoryDBRepository(),
       and visitRepository:VisitRepository) {
    self.visitorRepository = visitorRepository
    self.visitRepository = visitRepository
  }
  
  func saveVisit(name: String?,
                 email: String?,
                 phone: String?,
                 homeAddress: String?,
                 workAddress: String?,
                 checkInDate: Date?){
    
    let visitor = VisitorModel(id: Date().timeIntervalSince1970.description, name: name ?? "NA", email: email ?? "NA", phone: phone ?? "NA", homeAddress: homeAddress, workAddress: workAddress)
    visitorRepository.save(visitor) { (result) in
      print(result)
      let visitModel = VisitModel(id: Date().timeIntervalSince1970.description, visitor: visitor, checkIn: checkInDate, checkOut: nil)
      visitRepository.save(visitModel) { (result) in
        print(result)
      }
    }
    
    
    
  }
  
  
}
