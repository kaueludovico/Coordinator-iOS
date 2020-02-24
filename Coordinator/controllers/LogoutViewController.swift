//
//  ThirdViewController.swift
//  Coordinator
//
//  Created by Kaue Ludovico on 23/02/2020.
//  Copyright © 2020 Kaue Ludovico. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDefault()
    }
    
    func setupDefault() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Navigation
    @IBAction func logoutAction(_ sender: Any) {
        coordinator?.startViewController()
    }
}
