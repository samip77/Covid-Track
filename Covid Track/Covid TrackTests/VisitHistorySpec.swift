//
//  VisitHistorySpec.swift
//  Covid TrackTests
//
//  Created by Samip shah on 9/9/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Covid_Track

class VisitHistorySpec: QuickSpec {
  override func spec() {
    describe("Visit History") {
      var visitHistoryViewModel: VisitHistoryViewModel!
      var visitRepository: VisitRepository!
      
      context("if database doesn't have error") {
        beforeEach {
          visitRepository = MockVisitRepository()
          visitHistoryViewModel = VisitHistoryViewModel(with: visitRepository)
        }
        
        it("visitViewModels length should be zero and should not have error") {
          visitHistoryViewModel.loadVisitors { (result) in
            switch result {
            case .success(let visitViewModels):
              expect(visitViewModels).to(beEmpty(), description: "Count should be zero")
              
            case .failure(let error):
              expect(error).to(beNil(), description: "Should not have Error")
            }
          }
        }
      }
      
      context("if database have error") {
        beforeEach {
          visitRepository = MockVisitRepository(with: false)
          visitHistoryViewModel = VisitHistoryViewModel(with: visitRepository)
        }
        
        it("visitViewModels should be nil and should have error") {
          visitHistoryViewModel.loadVisitors { (result) in
            switch result {
            case .success(let visitViewModels):
              expect(visitViewModels).to(beNil(), description: "Should be nil")
              
            case .failure(let error):
              expect(error as? VisitRecordError).to(equal(VisitRecordError(message: "Visit Database Error")), description: "Should have Error")
            }
          }
        }
      }
    }
  }
}


