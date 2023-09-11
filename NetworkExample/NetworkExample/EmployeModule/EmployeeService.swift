//
//  EmployeViewModel.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation

protocol EmployeeServiceable {
    func getAllEmployee() async -> Result<[Employee], NetworkError>
    func getEmployeDetail(id: Int) async -> Result<Employee, NetworkError>
}

struct EmployeeService: NetworkClient, EmployeeServiceable {

    func getAllEmployee() async -> Result<[Employee], NetworkError> {
        return await sendRequest(networkRequest: EmployeeServiceRequest.all, model: [Employee].self)
    }

    func getEmployeDetail(id: Int) async -> Result<Employee, NetworkError> {
        return await sendRequest(networkRequest: EmployeeServiceRequest.detail(id: id), model: Employee.self)
    }


}
