//
//  VisitDetailSpec.swift
//  Covid TrackTests
//
//  Created by Samip shah on 9/9/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Covid_Track

class VisitDetailSpec: QuickSpec {
  override func spec() {
    describe("Visit Detail") {
      var visitModel: VisitModel!
      var visitorModel: VisitorModel!
      var visitViewModel: VisitViewModel!
      
      beforeEach {
        visitorModel = VisitorModel(id: "0", profile: nil, name: "Samip", email: "samipsagar@gmail.com", phone: "0450487254", homeAddress: "St Albans", workAddress: "Melbourne")
        visitModel = VisitModel(id: "1", visitor: visitorModel, temperatureLevel: 0, checkIn: Date(), checkOut: Date())
        visitViewModel = VisitViewModel(visitModel)
      }
      
      context("on Visit History Detail Clicked") {
        it("visit detail view model should update the detail of visit and visitor appropriately") {
          expect(visitViewModel.profile).to(beNil())
          expect(visitViewModel.name).to(equal("Samip"))
          expect(visitViewModel.email).to(equal("samipsagar@gmail.com"))
          expect(visitViewModel.phone).to(equal("0450487254"))
          expect(visitViewModel.home).to(equal("St Albans"))
          expect(visitViewModel.work).to(equal("Melbourne"))
          expect(visitViewModel.temperatureLevel).to(equal("Normal"))
          expect(visitViewModel.temperatureDescription).to(equal("Less than equal to 37 degree"))
          expect(visitViewModel.temperatureColor).to(equal(.black))
        }
      }
      
      context("getTimedDescription function") {
        let dateToCheck = Date(timeIntervalSince1970: 0.0)
        it("should display formatted date in string") {
          expect(visitViewModel.getTimeDescription(date: dateToCheck)).to(equal("10:00 1970/01/01 "),description: visitViewModel.getTimeDescription(date: dateToCheck))
        }
      }
    }
  }
}
