//
//  VisitorModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation
import RealmSwift
//
//public class VisitorModel: Object, Codable {
//    @objc dynamic var id: String
//    @objc dynamic var name: String
//    @objc dynamic var email: String
//    @objc dynamic var phone: String
//    @objc dynamic var homeAddress: String? = nil
//    @objc dynamic var workAddress: String? = nil
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case name = "name"
//        case email = "email"
//        case phone = "phone"
//        case homeAddress = "homeAddress"
//        case workAddress = "workAddress"
//    }
//
//    public init(id: String , name: String, email: String, phone: String, homeAddress: String?, workAddress: String?) {
//        self.id = id
//        self.name = name
//        self.email = email
//        self.phone = phone
//        self.homeAddress = homeAddress
//        self.workAddress = workAddress
//    }
//
//}

class VisitorModel: Object {
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var email: String = ""
  @objc dynamic var phone: String = ""
  @objc dynamic var homeAddress: String? = nil
  @objc dynamic var workAddress: String? = nil
  
  convenience init(id: String , name: String, email: String, phone: String, homeAddress: String?, workAddress: String?){
    self.init()
    self.id = id
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

