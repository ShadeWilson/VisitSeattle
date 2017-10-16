//
//  SightsTableViewController.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 10/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import UIKit

protocol VisitedDelegate: class {
    func visitedSightNumber(_ index: Int, hasVisited: Bool)
}

class SightsTableViewController: UITableViewController, VisitedDelegate {
    
    var sights = SightsSource.sights
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    func loadList(){
        self.tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SightsCell", for: indexPath) as? SightsCell else { fatalError() }

        let sight = sights[indexPath.row]
        
        // if using a basic cell layout
        //cell.textLabel?.text = sight.name
        //cell.imageView?.image = sight.image
        //cell.detailTextLabel?.text = sight.category
        
        cell.sightImageView.image = sight.image
        cell.nameLabel.text = sight.name
        
        if sight.hasVisited {
            cell.visitedLabel.alpha = 1.0
        } else {
            cell.visitedLabel.alpha = 0.0
        }
        
        
        return cell
    }
    

    // MARK: - Determining is a sight has been visited or not
    // function required by our delegate protocol
    func visitedSightNumber(_ index: Int, hasVisited: Bool) {
        if hasVisited {
            sights[index].hasVisited = true
        } else {
            sights[index].hasVisited = false
        }
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
                sightsDetailController.sightIndex = indexPath.row
                sightsDetailController.delegate = self
                
            }
        }
    }
    
    

}
