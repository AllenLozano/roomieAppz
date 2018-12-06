//
//  LogInViewController.swift
//  roomieApp
//
//  Created by user145766 on 11/30/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit
import Parse

extension UIViewController {
    func hideKeyboard() {
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorMessageLabel.text = ""
        
        self.hideKeyboard()
    }
    
    @IBAction func onTapLogIn(_ sender: Any) {
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            self.errorMessageLabel.text = "Please enter valid email & password"
        }
        else {
            PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) -> Void in
                if user != nil {
                    print("You're logged in!")
                    
                    self.performSegue(withIdentifier: "loggedInSegue", sender: nil)
                }
                else {
                    print("Failed to log in")
                    self.errorMessageLabel.text = "Failed to log in"
                }
            }
        }
    }
    
    @IBAction func onTapSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}
