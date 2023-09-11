//
//  EmployeService.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation


enum EmployeeServiceRequest {
    case all
    case detail(id: Int)
}

extension EmployeeServiceRequest: NetworkRequest {
    var path: String {
        switch self {
        case .all:
            return "employee/getAllEmployee"
        case .detail(let id):
            return "/employee/getDetail/\(id)"

        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .all, .detail:
            return .Get
        }
    }
}
