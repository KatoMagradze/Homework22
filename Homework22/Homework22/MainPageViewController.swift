//
//  HomePageViewController.swift
//  Homework22
//
//  Created by Kato on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class MainPageViewController: UIViewController {
    
    var postsArr = [UserPost]()
    var loggedUser = UserAccount()
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        let t = self.tabBarController as? MyTabBarController
        self.loggedUser = t!.userAccount
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch()
    }
    
    

}
extension MainPageViewController {
    func fetch() {
        let container = AppDelegate.coreDataContainer
        
        let context = container.viewContext
        let request: NSFetchRequest<UserPost> = UserPost.fetchRequest()
        
        self.postsArr.removeAll()
        
        do {
            let result = try context.fetch(request)
            guard let data = result as? [NSManagedObject] else {return}
            
            
            for item in data {
                if let p = item as? UserPost {
                    if p.username == self.loggedUser.username {
                       self.postsArr.append(p)
                    }
                }
            }
        }
        catch {}
        tableView.reloadData()
    }
    
    func fetchUser(username: String) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<UserAccount> = UserAccount.fetchRequest()
        
        do {
            let userAccount = try context.fetch(request)

            for i in userAccount {
                if i.username == username {
                    self.loggedUser = i
                    break
                }
            }
        } catch {}

    }
}
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "main_page_cell", for: indexPath) as! MainPageCell
        
        cell.nameLabel.text! = self.loggedUser.firstname! + " " + self.loggedUser.lastname!
        cell.postContentLabel.text = postsArr[indexPath.row].content
        let dt = postsArr[indexPath.row].date!
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.dateLabel.text = format.string(from: dt)
        cell.profileImage.image = UIImage(data: self.loggedUser.profilepicture!)
        return cell
    }
    
}

