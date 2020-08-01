//
//  VisitorRepository.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

protocol VisitorRepository {
  func save(_ visitor: VisitorModel, onCompletion: (_: Result<Bool, Error>) -> ())
  func getVisitors(onCompletion: (Result<[VisitorModel],Error>) -> ())
}
