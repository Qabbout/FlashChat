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

    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.title
        navigationItem.hidesBackButton = true

        tableView.dataSource = self

        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

    }

    @IBAction func sendPressed(_ sender: UIButton) {

        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) { error in
                if let error = error {
                    print("Couldnt save data to Firestore \(error)")
                }
            }

        }
    }

    @IBAction func logOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)

        } catch let signOutError as NSError {

            print(signOutError.localizedDescription)
        }
    }

}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = "text"
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }


}
