//
//  RoommatesTableViewController.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit
import Firebase

class RoommatesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        self.navigationItem.rightBarButtonItem = addBarButton
        observeMyChores()
    }
    
    func observeMyChores() {
        Network.sharedInstance.householdsRef.child(Network.sharedInstance.myHouseholdRef).child(Network.Reference.Chores.rawValue).observe(.value, with: { (snapshot) in
            var chores = [Chore]()
            for item in snapshot.children {
                let dataSnapshot = item as! FIRDataSnapshot
                let aChore = Chore(snapshot: dataSnapshot)
                chores.append(aChore)
            }
            DataManager.sharedInstance.myChores = chores
            self.tableView.reloadData()
        })
    }
    
    func didTapAdd() {
        DataManager.sharedInstance.createNewChore(name: "newChore", key: Date().description)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.sharedInstance.myChores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roommateTableViewCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = DataManager.sharedInstance.myChores[indexPath.row].name
        cell.detailTextLabel?.text = DataManager.sharedInstance.myChores[indexPath.row].key
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .fade)

            // Delete the row from the data source
            let item = DataManager.sharedInstance.myChores[indexPath.row]
            item.ref?.removeValue()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
