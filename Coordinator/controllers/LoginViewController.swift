//
//  ViewController.swift
//  Coordinator
//
//  Created by Kaue Ludovico on 23/02/2020.
//  Copyright © 2020 Kaue Ludovico. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblWarning: UILabel!
    
    let defaultEmail = "testcoordinator@example.com"
    let defaultPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDeafult()
    }
    
    // MARK: - Setup default
    
    func setupDeafult() {
        txtEmail.text = defaultEmail
        txtPassword.text = defaultPassword
        navigationController?.navigationBar.isHidden = true
        lblWarning.isHidden = true
    }
    
    // MARK: - Navigation
    
    @IBAction func loginAction(_ sender: Any) {
        if (txtEmail.text != defaultEmail || txtPassword.text != defaultPassword) {
            lblWarning.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.coordinator?.navigationRegisterController()
            }
        } else {
            lblWarning.isHidden = true
            coordinator?.navigationLogoutController()
        }
    }
    
    @IBAction func resgiterAction(_ sender: Any) {
        coordinator?.navigationRegisterController()
    }
}

