//
//  VisitorDatabaseRespository.swift
//  Covid Track
//
//  Created by Samip shah on 1/8/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import RealmSwift

class VisitoryDBRepository: VisitorRepository {
  
  let realm = try! Realm()
  
  func save(_ visitor: VisitorModel, onCompletion: (Result<Bool, Error>) -> ()) {
    do{
      try realm.write{
        realm.add(visitor, update: .modified)
      }
    }catch(let error){
      onCompletion(.failure(error))
    }
    onCompletion(.success(true))
  }
  
  func getVisitors(onCompletion: (Result<[VisitorModel], Error>) -> ()) {
    let objects: [VisitorModel] = realm.objects(VisitorModel.self).map { $0 }
    onCompletion(.success(objects))
  }
  
}
