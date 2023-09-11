//
//  EmployeServiceViewModel.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation


class EmployeeServiceViewModel {

    let service: EmployeeServiceable

    @Published var allEmloyee: [Employee]?

    init(service: EmployeeServiceable) {
      self.service = service
    }

    func getAllEmployee() {
        Task(priority: .background) {
            let result = await service.getAllEmployee()

            switch result {
            case .success(let allEmployee):
                allEmloyee = allEmployee
            case .failure(let error):
                print("An Error Occurred \(error.localizedDescription)")
            }
        }
    }
}
