//
//  LoginService.swift
//  iOS Assignment
//
//  Created by Anders Kløverpris Gotfredsen on 20/06/16.
//  Copyright © 2016 Anders Kløverpris Gotfredsen. All rights reserved.
//

import Foundation

enum Errors: ErrorType {
    case InvalidEmail
    
    case InvalidDomain
    
    case IncorrectPassword
}

class LoginService {
    
    func login(email: String, password: String) throws {
        guard let indexOfAt = email.characters.indexOf("@") else { throw Errors.InvalidEmail }
        let domain = email.substringFromIndex(indexOfAt)
        if domain != "@shopgun.dk" {
            throw Errors.InvalidDomain
        }
        let correctPassword = email.substringToIndex(indexOfAt)
        if correctPassword.isEmpty {
            throw Errors.InvalidEmail
        }
        if password != correctPassword {
            throw Errors.IncorrectPassword
        }
        Session.loggedIn = true
    }
}