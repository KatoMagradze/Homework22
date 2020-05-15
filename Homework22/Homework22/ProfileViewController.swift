//
//  ProfileViewController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var newFirstNameTextField: UITextField!
    @IBOutlet weak var newLastNameTextField: UITextField!
    @IBOutlet weak var newUsernameTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    var userToUpdate = UserAccount()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let t = self.tabBarController as? MyTabBarController
        self.userToUpdate = t!.userAccount
        
        self.newFirstNameTextField.text! = self.userToUpdate.firstname!
        self.newLastNameTextField.text! = self.userToUpdate.lastname!
        self.newUsernameTextField.text! = self.userToUpdate.username!
        self.newEmailTextField.text! = self.userToUpdate.email!
        self.newPasswordTextField.text! = self.userToUpdate.password!
        
        
    }

    @IBAction func onUpdateTapped(_ sender: UIButton) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        self.userToUpdate.firstname = self.newFirstNameTextField.text!
        self.userToUpdate.lastname = self.newLastNameTextField.text!
        self.userToUpdate.username = self.newUsernameTextField.text!
        self.userToUpdate.email = self.newEmailTextField.text!
        self.userToUpdate.password = self.newPasswordTextField.text!
        
        do {
            try context.save()
            print("Updated")
        } catch {}

    }
    
}
