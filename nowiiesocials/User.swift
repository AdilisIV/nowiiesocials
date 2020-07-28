//
//  User.swift
//  nowiiesocials
//
//  Created by user on 25.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import Foundation

struct User: Decodable, Identifiable {
    var id: String
    var firstname: String?
    var lastname: String?
    var email: String?
    var phone: String?
    var request: String?
    var about: String?
    var dating_status: String?
}
