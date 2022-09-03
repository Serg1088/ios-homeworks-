//
//  TestUserService.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.09.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
    let userTest = User(login: "111", fullName: "TestName", avatar: UIImage(named: "Test")!, status: "Тест", password: "111")
    
    func verification (login: String) -> User? {
        userTest.login == login ? userTest : nil
    }
}

