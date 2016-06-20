//
//  LoginViewController.swift
//  iOS Assignment
//
//  Created by Anders Kløverpris Gotfredsen on 18/06/16.
//  Copyright © 2016 Anders Kløverpris Gotfredsen. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let enterEmailMessage = "Please enter your email address"
    let invalidDomainMessage = "You need a shopgun.dk email address to log in"
    let enterPasswordMessage = "Please enter your password"
    let invalidEmailMessage = "You must enter a valid email address"
    let incorrectPasswordMessage = "Incorrect password"
    let unknownErrorMessage = "Unknown error"
    
    @IBAction func login(sender: AnyObject) {
        guard let email = emailTextField.text else {
            showErrorMessage(enterEmailMessage)
            return
        }
        guard let password = passwordTextField.text else {
            showErrorMessage(enterPasswordMessage)
            return
        }
        
        let loginService = LoginService()
        do {
            try loginService.login(email, password: password)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        catch Errors.InvalidEmail {
            showErrorMessage(invalidEmailMessage)
        }
        catch Errors.InvalidDomain {
            showErrorMessage(invalidDomainMessage)
        }
        catch Errors.IncorrectPassword {
            showErrorMessage(incorrectPasswordMessage)
        }
        catch {
            showErrorMessage(unknownErrorMessage)
        }
    }
    
    func showErrorMessage(message: String) {
        let alertController = UIAlertController(title: "error", message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in
        }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}