//
//  VisitorRepository.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

enum DBResult {
  case success
  case failure(error: String)
}

protocol VisitorRepository {
  func save(_ visitor: VisitorModel, onCompletion: (_  result: DBResult) -> ())
}
