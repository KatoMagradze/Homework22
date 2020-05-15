//
//  AddPostViewController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class AddPostViewController: UIViewController {

    @IBOutlet weak var newPostTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAddPostTapped(_ sender: UIButton) {
        save() 
    }
    
}
extension AddPostViewController {
    func save() {
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "UserPost", in: context)
        let userNoteObject = NSManagedObject(entity: entityDescription!, insertInto: context)
        
        userNoteObject.setValue(newPostTextView.text!, forKey: "content")
        let t = self.tabBarController as? MyTabBarController
        userNoteObject.setValue(String(t?.loggedUsername ?? ""), forKey: "username")
        let date = Date()
        userNoteObject.setValue(date, forKey: "date")
        do {
            try context.save()
            print("success")
        }
        catch {
            print("failed")
        }
    }
}
