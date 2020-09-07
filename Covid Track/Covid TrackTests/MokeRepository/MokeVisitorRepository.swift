//
//  MokeVisitorRepository.swift
//  Covid TrackTests
//
//  Created by Samip shah on 7/9/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
@testable import Covid_Track

class MockVisitorRepository: VisitorRepository {
  private var databaseSuccess: Bool
  
  init(with saveSuccess: Bool = true) {
    self.databaseSuccess = saveSuccess
  }

  func save(_ visitor: VisitorModel, onCompletion: (Result<Bool, Error>) -> ()) {
    if(databaseSuccess) {
       onCompletion(.success(true))
    } else {
      onCompletion(.failure(VisitRecordError(message: "Database Error")))
    }
   
  }
  
  func getVisitors(onCompletion: (Result<[VisitorModel], Error>) -> ()) {
    
  }
  
}
