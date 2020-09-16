//
//  VisitDBRepository.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import RealmSwift

class VisitDBRepository: VisitRepository {
  let realm = try! Realm()
  
  func save(_ visit: VisitModel, onCompletion: (Result<Bool, Error>) -> ()) {
    do{
      try realm.write {
        realm.add(visit, update: .modified)
      }
    }catch(let error) {
      onCompletion(.failure(error))
    }
    onCompletion(.success(true))
  }
  
  func getVisits(onCompletion: (Result<[VisitModel], Error>) -> ()) {
    let objects: [VisitModel] = realm.objects(VisitModel.self).sorted(byKeyPath: "checkIn", ascending: false).map { $0 }
    onCompletion(.success(objects))
  }
}
