//
//  ViewController.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import UIKit

class ViewController: UIViewController {

    var employeServiceViewModel: EmployeeServiceViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        employeServiceViewModel = EmployeeServiceViewModel(service: EmployeeService())
        employeServiceViewModel?.getAllEmployee()
    }
}

