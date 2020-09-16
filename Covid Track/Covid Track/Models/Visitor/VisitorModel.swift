//
//  VisitorModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorModel: Object {
  @objc dynamic var id: String = ""
  @objc dynamic var profile: Data? = nil
  @objc dynamic var name: String = ""
  @objc dynamic var email: String = ""
  @objc dynamic var phone: String = ""
  @objc dynamic var homeAddress: String? = nil
  @objc dynamic var workAddress: String? = nil
  
  convenience init(id: String ,profile: Data?, name: String, email: String, phone: String, homeAddress: String?, workAddress: String?){
    self.init()
    self.id = id
    self.profile = profile
    self.name = name
    self.email = email
    self.phone = phone
    self.homeAddress = homeAddress
    self.workAddress = workAddress
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

