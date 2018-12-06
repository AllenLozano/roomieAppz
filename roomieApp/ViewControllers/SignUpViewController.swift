//
//  SignUpViewController.swift
//  roomieApp
//
//  Created by user145766 on 11/30/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var groupIDTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    /*
     Cannot find out how to add property to PFUser so we need to just make an
     account with an email as a username and then just present the sign up screen,
     but only use the log in screen on demo video
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorMessageLabel.text = ""
        
        self.hideKeyboard()
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = emailTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Yeay created new user!")
                
                self.performSegue(withIdentifier: "signedUpSegue", sender: nil)
            }
            else {
                print(error!.localizedDescription)
                if error?._code == 202 {
                    self.errorMessageLabel.text = "Account already exists with email"
                }
            }
        }
    }
    
    @IBAction func onTapLogIn(_ sender: Any) {
        self.performSegue(withIdentifier: "logInSegue", sender: nil)
    }
    
}
