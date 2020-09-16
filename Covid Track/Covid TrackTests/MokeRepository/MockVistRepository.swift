//
//  MokeVistRepository.swift
//  Covid TrackTests
//
//  Created by Samip shah on 7/9/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
@testable import Covid_Track

class MockVisitRepository: VisitRepository {
  private var databaseSuccess: Bool
  
  init(with success: Bool = true) {
    databaseSuccess = success
  }
  
  func save(_ visit: VisitModel, onCompletion: (Result<Bool, Error>) -> ()) {
    if databaseSuccess {
      onCompletion(.success(true))
    } else {
      onCompletion(.failure(VisitRecordError(message: "Visit Database Error")))
    }
  }
  
  func getVisits(onCompletion: (Result<[VisitModel], Error>) -> ()) {
    if databaseSuccess {
      onCompletion(.success([]))
    } else {
      onCompletion(.failure(VisitRecordError(message: "Visit Database Error")))
    }
  }
}
