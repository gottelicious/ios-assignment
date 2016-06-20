//
//  ViewController.swift
//  iOS Assignment
//
//  Created by Anders Kløverpris Gotfredsen on 18/06/16.
//  Copyright © 2016 Anders Kløverpris Gotfredsen. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.topItem?.title = "Start"
    }
    
    override func viewWillAppear(animated: Bool) {
        if Session.loggedIn {
            let logoutButton = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(StartupViewController.logout(_:)))
            navigationItem.rightBarButtonItem = logoutButton
        }
        else {
            let loginButton = UIBarButtonItem(title: "Login", style: .Plain, target: self, action: #selector(StartupViewController.goToLogin(_:)))
            navigationItem.rightBarButtonItem = loginButton
        }
    }

    func goToLogin(sender: AnyObject) {
        performSegueWithIdentifier("loginSegue", sender: self)
    }
    
    func logout(sender: AnyObject) {
        Session.loggedIn = false
        let loginButton = UIBarButtonItem(title: "Login", style: .Plain, target: self, action: #selector(StartupViewController.goToLogin(_:)))
        navigationItem.rightBarButtonItem = loginButton
    }
}

