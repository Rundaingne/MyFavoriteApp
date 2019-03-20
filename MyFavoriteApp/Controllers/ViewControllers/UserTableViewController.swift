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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPostCell", for: indexPath)
        let user = UserController.shared.users[indexPath.row]

        return cell
    }
    
    func presentAlertController() {
        
    }


    //MARK: - Actions
    @IBAction func addPostButtonTapped(_ sender: UIBarButtonItem) {
        //We will be presenting an alerty controller here.
        
    }

}
