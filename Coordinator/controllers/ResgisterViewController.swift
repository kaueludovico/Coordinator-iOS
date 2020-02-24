//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Kaue Ludovico on 23/02/2020.
//  Copyright © 2020 Kaue Ludovico. All rights reserved.
//

import Foundation
import UIKit

class ResgisterViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var txtEmailRegister: UITextField!
    @IBOutlet weak var txtPasswordRegister: UITextField!
    
    let defaultEmail = "testcoordinator@example.com"
    let defaultPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDefault()
    }
    
    func setupDefault() {
        navigationController?.navigationBar.isHidden = true
        txtEmailRegister.text = defaultEmail
        txtPasswordRegister.text = defaultPassword
    }

    // MARK: - Navigation
    
    @IBAction func registerAction(_ sender: Any) {
        if ((txtEmailRegister.text?.isEmpty)! || (txtPasswordRegister.text?.isEmpty)!) {
            alert(title: "Error", msg: "Field of email or password is empty.")
        } else if (isValidEmail(email: txtEmailRegister.text!) && (txtPasswordRegister.text?.isEmpty != true)) {
            coordinator?.navigationLogoutController()
        } else {
            alert(title: "Error", msg: "This email is invalid.")
        }
    }
    
    // MARK: - Validation Email
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // MARK: - Alert
    
    func alert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
