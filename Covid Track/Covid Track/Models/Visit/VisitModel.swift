//
//  File.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import RealmSwift

class VisitModel: Object {
  @objc dynamic var id: String = "0"
  @objc dynamic var visitor: VisitorModel?
  @objc dynamic var checkIn: Date?
  @objc dynamic var checkOut: Date?
  
  convenience init(id: String, visitor: VisitorModel?, checkIn: Date?, checkOut: Date?) {
      self.init()
      self.id = id
      self.visitor = visitor
      self.checkIn = checkIn
      self.checkOut = checkOut
  }
  
  override static func primaryKey() -> String? {
      return "id"
  }

}



