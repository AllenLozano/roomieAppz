//
//  HomeViewController.swift
//  roomieApp
//
//  Created by user145766 on 12/1/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var chores: [Chore] = []
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
