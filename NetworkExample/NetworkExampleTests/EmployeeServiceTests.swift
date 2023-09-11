//
//  EmployeeServiceTests.swift
//  NetworkExampleTests
//
//  Created by Chandan on 11/09/23.
//

import XCTest
@testable import NetworkExample

final class EmployeeServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func  testEmployeeViewModel() {
        let sut = EmployeeServiceViewModel(service: EmployeeServiceMock())

        let expectation =  expectation(description: "Get all employee data")

        sut.getAllEmployee()

        XCTAssertEqual(sut.allEmloyee?.count, 1)
        waitForExpectations(timeout: 3.0, handler: nil)

    }

}

final class EmployeeServiceMock:  EmployeeServiceable {

    func getAllEmployee() async -> Result<[Employee], NetworkError> {
        return .success([Employee(empID: "3", firstName: "John", lastName: "Mathew", emailID: "john@exaple.com", dept: "BGS")])
    }

    func getEmployeDetail(id: Int) async -> Result<Employee, NetworkError> {
        return .success(Employee(empID: "3", firstName: "John", lastName: "Mathew", emailID: "john@exaple.com", dept: "BGS"))
    }
}
