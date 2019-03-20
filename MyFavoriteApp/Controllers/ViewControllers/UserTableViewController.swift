//
//  UserTableViewController.swift
//  MyFavoriteApp
//
//  Created by Brooke Kumpunen on 3/20/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableView.automaticDimension
        UserController.shared.getUsers { (_) in
            DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserController.shared.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPostCell", for: indexPath)
        let user = UserController.shared.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.favoriteApp
        return cell
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Create a post", message: "What's your favorite app?", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Username"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Message"
        }
        
        let postAction = UIAlertAction(title: "Post", style: .default) { (_) in
            guard let username = alertController.textFields?[0].text,
                let favoriteApp = alertController.textFields?[1].text else {return}
            UserController.shared.postUser(name: username, favoriteApp: favoriteApp, completion: { (_) in
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            })
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }


    //MARK: - Actions
    @IBAction func addPostButtonTapped(_ sender: UIBarButtonItem) {
        //We will be presenting an alerty controller here.
        presentAlertController()
        
    }

}
