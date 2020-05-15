//
//  MyTabBarController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class MyTabBarController: UITabBarController {
    
    var loggedUsername = ""
    var userAccount = UserAccount()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        fetchUser()
        
    }
    


}
extension MyTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print(#function)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        //print(fromVC)
        //print(toVC)
        
        return nil
    }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<UserAccount> = UserAccount.fetchRequest()
        
        do {
            let userAccount = try context.fetch(request)

            for i in userAccount {
                if i.username == loggedUsername {
                    self.userAccount = i
                    break
                }
            }
        } catch {}

    }

}
