//
//  SightsTableViewController.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 10/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import UIKit

class SightsTableViewController: UITableViewController {
    
    var sights = SightsSource.sights

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // how many sections do we want per source of sights?
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // returns only 1 section
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sights.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //identifier specified on main.storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "SightsCell", for: indexPath)

        let sight = sights[indexPath.row]
        
        cell.textLabel?.text = sight.name
        cell.imageView?.image = sight.image
        cell.detailTextLabel?.text = sight.category
        
        return cell
    }
    

    

    

    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // identifier must be showSight
        if segue.identifier == "showSight" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let sight = sights[indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let sightsDetailController = navigationController.topViewController as? SightsDetailController else { return }
                
                sightsDetailController.sight = sight
            }
        }
    }
    

}
