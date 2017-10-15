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
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
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
        
        if indexPath.section == 0 && indexPath.row == 2 {
            rowHeight = UITableViewAutomaticDimension
        } else {
            rowHeight = 44
        }
        
        return rowHeight
    }

    // MARK: - Configure Cell View
    
    func configureView() {
        guard let sight = sight else { return }
        
        descriptionLabel.text = "Hello"
        
        /*
        sightNameLabel.text = sight.name
        descriptionLabel.text = sight.description
        sightNeighborhoodLabel.text = sight.neighborhood
        sightAddressLabel.text = sight.address
        categoryLabel.text = sight.category
        
        if sight.isIncludedCityPass {
            isIncludedCityPassLabel.text = "Yes"
        } else {
            isIncludedCityPassLabel.text = "No"
        }
        
        costLabel.text = sight.cost
        //sightImageView.image = sight.image
        */
    }

    
}

