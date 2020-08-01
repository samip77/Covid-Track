//
//  VisitHistoryViewModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

class VisitHistoryViewModel {
  
  private let visitRepository:VisitRepository
  
  var visits:[VisitViewModel] = []
  
  init(with visitRepository:VisitRepository) {
    self.visitRepository = visitRepository
  }
  
  func loadVisitors(_onCompletion: @escaping (_ : Result<[VisitViewModel], Error>) -> ()){
    visitRepository.getVisits { (result) in
      let newResult = result.map { (visitorModels) -> [VisitViewModel] in
        return visitorModels.map {
          VisitViewModel($0)
        }
      }
      
      _onCompletion(newResult)
    }
  }
}
