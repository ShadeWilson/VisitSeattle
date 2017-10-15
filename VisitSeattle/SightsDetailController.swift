//
//  SightsDetailController.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 10/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import UIKit

class SightsDetailController: UITableViewController {

    var sight: Sight?
    var sightIndex: Int?
    
    weak var delegate: VisitedDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var isIncludedCityPassLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var sightImageView: UIImageView!
    
    @IBOutlet weak var sightVisitButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        configureView()
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // need to feed an estimated hieght if using automatic dimension
        tableView.estimatedRowHeight = 80
        var rowHeight: CGFloat
    
        // specify that specifically that the second cell has a variable height
        // could do it for all, but that's unsafe
        // FIX: - Doesn't differentiate between sections
        
        if indexPath.section == 0 && indexPath.row == 3 {
            rowHeight = UITableViewAutomaticDimension
        } else if indexPath.section == 0 && indexPath.row == 0 {
            rowHeight = 200
        } else {
            rowHeight = 44
        }

        
        return rowHeight
    }

    // MARK: - Configure Cell View
    
    func configureView() {
        guard let sight = sight else { return }
        
        nameLabel.text = sight.name
        descriptionLabel.text = sight.description
        neighborhoodLabel.text = sight.neighborhood
        addressLabel.text = sight.address
        categoryLabel.text = sight.category
        
        if sight.isIncludedCityPass {
            isIncludedCityPassLabel.text = "Yes"
        } else {
            isIncludedCityPassLabel.text = "No"
        }
        
        costLabel.text = sight.cost
        sightImageView.image = sight.image
        
        configureVistedButton()
        
    }
    
    @IBAction func visit() {
        
        if sight?.hasVisited == true {
            sight?.hasVisited = false
            sightVisitButton.setTitle("To Do", for: .normal)
            sightVisitButton.backgroundColor = UIColor(displayP3Red: 0.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
            delegate?.visitedSightNumber(sightIndex!, hasVisited: false)
        } else {
            sight?.hasVisited = true
            sightVisitButton.setTitle("Visited!", for: .normal)
            sightVisitButton.backgroundColor = UIColor(displayP3Red: 0.0, green: 128/255.0, blue: 64/255.0, alpha: 1.0)
            delegate?.visitedSightNumber(sightIndex!, hasVisited: true)
            
        }
    }
    
    
    func configureVistedButton() {
        if sight?.hasVisited == true {
            sightVisitButton.setTitle("Visited!", for: .normal)
            sightVisitButton.backgroundColor = UIColor(displayP3Red: 0.0, green: 128/255.0, blue: 64/255.0, alpha: 1.0)
        } else {
            sightVisitButton.setTitle("To Do", for: .normal)
            sightVisitButton.backgroundColor = UIColor(displayP3Red: 0.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
        }
    }
    

    
}

