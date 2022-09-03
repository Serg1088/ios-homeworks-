//
//  User.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.09.2022.
//

import Foundation
import UIKit

class User {
    var login: String
    var fullName: String
    var avatar: UIImage
    var status: String
    var password: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String, password: String ) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
        self.password = password
    }
}

protocol UserService {
    func verification (login: String) -> User?
}

class CurrentUserService: UserService {
    
    let userLogin = User(login: "79224891529", fullName: "BelkinSK", avatar: UIImage(named: "ava")!, status: "В сети", password: "123")
        
    func verification (login: String) -> User? {
        userLogin.login == login ? userLogin : nil
    }
}
