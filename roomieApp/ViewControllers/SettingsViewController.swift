//
//  SettingsViewController.swift
//  roomieApp
//
//  Created by Allen Lozano on 12/5/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var choreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createChore(_ sender: Any) {
        
        let chorez = choreTextField.text ?? ""
       
        Chore.choresDifferent(withChore: chorez) { (success, error) in
            if (error != nil) {
                print(error.debugDescription)
            }
        }
    }
    
   
}
