//
//  SettingsViewController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogOutTapped(_ sender: UIButton) {
        if let signInVC = self.navigationController?.viewControllers.first {
            
                let vc = signInVC as! ViewController
                vc.usernameTextField.text = ""
                vc.passwordTextField.text = ""
                self.navigationController?.popToViewController(signInVC, animated: true)
        }
    }
}
