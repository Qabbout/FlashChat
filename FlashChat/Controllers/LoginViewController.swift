//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Abdulrahman on 3/6/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
        
    }
}
