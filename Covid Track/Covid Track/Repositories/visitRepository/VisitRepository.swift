//
//  VisitRepository.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

protocol VisitRepository {
  func save(_ visit: VisitModel, onCompletion: (_  result: DBResult) -> ())
}
