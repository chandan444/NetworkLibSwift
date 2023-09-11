//
//  Employe.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation

struct Employee: Codable {
    let empID: String
    let firstName: String
    let lastName: String
    let emailID: String
    let dept: String

    enum CodingKeys: String, CodingKey {
        case empID = "emp_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case emailID = "email_id"
        case dept
    }
}
