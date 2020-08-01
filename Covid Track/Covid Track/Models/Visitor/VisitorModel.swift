//
//  VisitorModel.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import Foundation

public struct VisitorModel: Codable {
    public let id: String
    public let name: String
    public let email: String
    public let phone: String
    public let homeAddress: String?
    public let workAddress: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case homeAddress = "homeAddress"
        case workAddress = "workAddress"
    }

    public init(id: String , name: String, email: String, phone: String, homeAddress: String?, workAddress: String?) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.homeAddress = homeAddress
        self.workAddress = workAddress
    }
}
