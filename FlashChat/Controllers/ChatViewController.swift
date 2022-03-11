//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Abdulrahman on 3/6/22.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendPressed(_ sender: UIButton) {
    }

    @IBAction func logOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()


        } catch let signOutError as NSError  {
            
            print(signOutError.localizedDescription)
        }
    }

}
