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
  
  func save(_ visit: VisitModel, onCompletion: (DBResult) -> ()) {
    do{
      let realm = try Realm()
      try realm.write{
        realm.add(visit, update: .modified)
      }
    }catch(let error){
      onCompletion(.failure(error: error.localizedDescription))
    }
    onCompletion(.success)
  }
}
