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
  func save(_ visit: VisitModel, onCompletion: (Result<Bool, Error>) -> ()) {
    
  }
  
  func getVisits(onCompletion: (Result<[VisitModel], Error>) -> ()) {
    
  }
  
  
}
