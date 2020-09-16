//
//  VisitRecordViewModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

class VisitRecordError: Error, Equatable {
  private (set) var localizedDescription: String
  
  init(message: String) {
    localizedDescription = message
  }
  
  static func == (lhs: VisitRecordError, rhs: VisitRecordError) -> Bool {
    lhs.localizedDescription == rhs.localizedDescription
  }
}

class VisitRecordViewModel {
  private let visitorRepository: VisitorRepository
  private let visitRepository: VisitRepository
  
  init(with visitorRepository: VisitorRepository = VisitoryDBRepository(),
       and visitRepository: VisitRepository = VisitDBRepository()) {
    self.visitorRepository = visitorRepository
    self.visitRepository = visitRepository
  }
  
  func saveVisit(profile: Data?,
                 name: String?,
                 email: String?,
                 phone: String?,
                 homeAddress: String?,
                 workAddress: String?,
                 temperatureLevel:Int,
                 checkInDate: Date,
                 onCompletion: (_: Result<Bool,VisitRecordError>) -> ()) {
    //validate name, email, phone number
    guard let name = name, !name.isEmpty else{
      onCompletion(.failure(VisitRecordError(message: "Enter you name.")))
      return
    }
    
    guard let email = email, email.isValidEmail else {
      onCompletion(.failure(VisitRecordError(message: "Enter valid email.")))
      return
    }
    
    guard let phone = phone, phone.isValidPhone else {
      onCompletion(.failure(VisitRecordError(message: "Enter valid 10 digit phone number.")))
      return
    }
    
    let visitor = VisitorModel(id: Date().timeIntervalSince1970.description,
                               profile: profile,
                               name: name ,
                               email: email,
                               phone: phone,
                               homeAddress: homeAddress,
                               workAddress: workAddress)
    visitorRepository.save(visitor) { (result) in
      switch result{
      case .success:
        let visitModel = VisitModel(id: Date().timeIntervalSince1970.description,
                                    visitor: visitor,
                                    temperatureLevel: temperatureLevel,
                                    checkIn: checkInDate,
                                    checkOut: nil)
        visitRepository.save(visitModel) { (finalResult) in
          switch finalResult{
          case .success(let success):
            onCompletion(.success(success))
          case .failure(let error):
            onCompletion(.failure(VisitRecordError(message: error.localizedDescription)))
          }
        }
        
      case .failure(let error):
        onCompletion(.failure(VisitRecordError(message: error.localizedDescription)))
      }
    }
  }
  
}
