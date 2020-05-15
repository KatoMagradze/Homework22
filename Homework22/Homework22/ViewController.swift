//
//  ViewController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onSignInTapped(_ sender: UIButton) {
        
        if getUser(username: usernameTextField.text!, password: passwordTextField.text!) {
            
            /*performSegue(withIdentifier: "tab_bar_segue", sender: self)
 */
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let temp = storyboard.instantiateViewController(withIdentifier: "tab_bar_vc")
            
            if let vc = temp as? MyTabBarController {
                vc.loggedUsername = usernameTextField.text!
            }
            
            self.navigationController?.pushViewController(temp, animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Try Again", message: "Incorrect username or password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let vc = segue.destination as! MyTabBarController
       // vc.loggedUsername = self.usernameTextField.text!
        

    }
 */
    
    
    @IBAction func onSignUpTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let temp = storyboard.instantiateViewController(withIdentifier: "sign_up_vc")
        
        self.navigationController?.pushViewController(temp, animated: true)

    }
}
extension ViewController {
    func getUser(username: String, password: String) -> Bool {
        
        var returnValue = false
        
        let container = AppDelegate.coreDataContainer
        
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserAccount")
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let data = result as? [NSManagedObject] else {return false}
            
            for item in data {
                if let p = item as? UserAccount {
                    if username == p.username && password == p.password {
                        returnValue = true
                        break
                    }
                }
            }
        }
        catch {}
        
        
        return returnValue
    }
}
