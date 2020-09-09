//
//  VisitRecordSpec.swift
//  Covid TrackTests
//
//  Created by Samip shah on 4/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Covid_Track

class VisitRecordSpec: QuickSpec {
  
  
  override func spec() {
    
    describe("VistRecordViewModel") {
      context("On CheckIn") {
        let visitorRepository = MockVisitorRepository()
        let visitRepository = MockVisitRepository()
        let viewModel = VisitRecordViewModel(with: visitorRepository, and: visitRepository);
        
        it("with Empty Name should show Enter you name Error.") {
          viewModel.saveVisit(profile: nil, name: nil, email: nil, phone: nil, homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { (result) in
            switch(result){
            case .success(let success):
              expect(success).to(equal(false), description: "Should be Error")
              
            case .failure(let error):
              expect(error).to(equal(VisitRecordError(message: "Enter you name.")), description: "Should be Error")
            }
          }
        }
        
        it("with name but without proper email should show Enter valid email") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "sss", phone: nil, homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { (result) in
            switch(result){
            case .success(let success):
              expect(success).to(equal(false), description: "Should be Error")
              
            case .failure(let error):
              expect(error).to(equal(VisitRecordError(message: "Enter valid email.")), description: "Should be Error")
            }
          }
        }
        
        it("with name but without valid phoneNumber should show Enter valid 10 digit phone number.") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "samip@gmail.com", phone: "045039", homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { (result) in
            switch(result){
            case .success(let success):
              expect(success).to(equal(false), description: "Should be Error")
              
            case .failure(let error):
              expect(error).to(equal(VisitRecordError(message: "Enter valid 10 digit phone number.")), description: "Should be Error instead got \(error.localizedDescription)")
            }
          }
        }
        
        it("with proper validation should call Save function") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "samip@gmail.com", phone: "0450487254", homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { result in
            switch result {
            case .success(let success):
              expect(success).to(equal(true), description: "Should Not Have Error")
              break
            case .failure(let error):
              expect(error).to(beNil(), description: "Should not have Error")
            }
          }
        }
        
        it("with proper validation should not show error") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "samip@gmail.com", phone: "0450487254", homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { (result) in
            switch(result){
            case .success(let success):
              expect(success).to(equal(true), description: "Should not be false")
              
            case .failure(let error):
              expect(error).to(beNil(), description: "Should not have Error")
            }
          }
        }
      }
    }
    
    describe("VistRecord ViewModel with VisiterRecord Database Error") {
      context("On CheckIn") {
        let visitorRepository = MockVisitorRepository(with: false)
        let visitRepository = MockVisitRepository()
        let viewModel = VisitRecordViewModel(with: visitorRepository, and: visitRepository);
        
        it("should show Database Error") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "samip@gmail.com", phone: "0450487254", homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { result in
            switch result {
            case .success(let success):
              expect(success).to(equal(false), description: "should have Error")
              
            case .failure(let error):
              expect(error).notTo(beNil(), description: "should have Error")
            }
          }
          
        }
      }
    }
    
    describe("VistRecord ViewModel with VisitRecord Database Error") {
      context("On CheckIn") {
        let visitorRepository = MockVisitorRepository()
        let visitRepository = MockVisitRepository(with: false)
        let viewModel = VisitRecordViewModel(with: visitorRepository, and: visitRepository);
        
        it("should show Database Error") {
          viewModel.saveVisit(profile: nil, name: "Samip", email: "samip@gmail.com", phone: "0450487254", homeAddress: nil, workAddress: nil, temperatureLevel: 0, checkInDate: Date()) { result in
            switch result {
            case .success(let success):
              expect(success).to(equal(false), description: "should have Error")
              
            case .failure(let error):
              expect(error).notTo(beNil(), description: "should have Error")
            }
          }
        }
      }
    }
    
  }
}
