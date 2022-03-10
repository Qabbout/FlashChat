//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Abdulrahman on 3/6/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func registerPressed(_ sender: UIButton) {

        if let email = emailTextfield.text, let password = passwordTextfield.text {

            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

                if let error = error {
                    print(error)
                }
                else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }

            }

        }
    }

}
