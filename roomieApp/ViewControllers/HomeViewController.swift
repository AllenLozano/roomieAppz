//
//  HomeViewController.swift
//  roomieApp
//
//  Created by user145766 on 12/1/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

/*
 Allen, for the chores, we might consider making them PFObjects that we can associate with
 the current user as guided by
 https://guides.codepath.com/ios/Building-Data-driven-Apps-with-Parse#fetching-data-from-parse-via-pfquery
 and we can just model our app video to show us adding a chore to an existing list of chores we
 can fetch from Parse and then logging out
 We can just describe all the other details. Let me know if you have any thoughts or questions via text.
 The log in I made to test the app is
 jsmith@gmail.com
 password
 -Kenia
 */

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var chores: [Chore] = []
    //var choreString: String!
    @IBOutlet var choresTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choresTableView.delegate = self as UITableViewDelegate
        choresTableView.dataSource = self as UITableViewDataSource
        choresTableView.rowHeight = 150
    
        fetchChoresData()
        choresTableView.reloadData()
    }
    
    
    @IBAction func onTapLogOut(_ sender: Any) {
        if PFUser.current() != nil {
            PFUser.logOutInBackground { (error: Error?) in
                if PFUser.current() == nil {
                    print("Current user is now nil")
                    
                    self.performSegue(withIdentifier: "loggedOutSegue", sender: nil)
                }
                else {
                    print("Failed to log out")
                }
            }
        }
        else {
            print("Current user is already nil")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = choresTableView.dequeueReusableCell(withIdentifier: "ChoresCell", for: indexPath) as! ChoresCell
        let chore = chores[indexPath.row]
        cell.indexPath = indexPath
        
        cell.nameLabel.text = PFUser.current()?.username
        cell.choreLabel.text = chore.choreString
        
        return cell
    }
    
    @objc func fetchChoresData() {
        // Create New PFQuery
        let query = Chore.query()
        query?.includeKey("name")
        query?.includeKey("choreString")
        //query?.includeKey("createdAt")
        //query?.includeKey("caption")
        query?.limit = 20
        
        // Fetch data asynchronously
        query?.findObjectsInBackground(block: { (chores, error) in
            if let chores = chores {
                self.chores = chores as! [Chore]
                self.choresTableView.reloadData()
            }
            else {
                print(error.debugDescription)
            }
        })
    }
    
}
