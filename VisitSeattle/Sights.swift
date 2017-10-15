//
//  Sights.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 10/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation
import UIKit

struct Sight {
    let name: String
    let neighborhood: String
    let address: String
    let category: String
    let description: String
    let isIncludedCityPass: Bool
    let cost: String
    let image: UIImage?
    var hasVisited: Bool
    
    // these properties are static so that they are type  properties
    // in other words, we do not need to make an instance of SightKey to use them
    // this stuct is a safer way to access the values we want from a dictionary
    // without having to worry about misspellings
    struct SightKey {
        static let name = "name"
        static let neighborhood = "neighborhood"
        static let address = "address"
        static let category = "category"
        static let description = "description"
        static let isIncludedCityPass = "isIncludedCityPass"
        static let cost = "cost"
    }
    
    // Optional init method to pass in a dictionary (plist) to retrieve
    // all the values we want
    // alternative is passing in values individually, which would be tedious
    init?(dictionary: [String: String]) {
        // check that everything exists or else return nil
        guard let name = dictionary[SightKey.name],
            let neighborhood = dictionary[SightKey.neighborhood],
            let address = dictionary[SightKey.address],
            let category = dictionary[SightKey.category],
            let description = dictionary[SightKey.description],
            let isIncludedString = dictionary[SightKey.isIncludedCityPass],
            let cost = dictionary[SightKey.cost] else { return nil }
        
        self.name = name
        self.neighborhood = neighborhood
        self.address = address
        self.category = category
        self.description = description
        self.cost = cost
        
        switch isIncludedString {
        case "1": self.isIncludedCityPass = true
        case "0": self.isIncludedCityPass = false
        default: self.isIncludedCityPass = false
        }
        
        // retrive image if it has the same name as its plist
        // this requires a bit of work making sure all image names are exactly the same!
        // else returns nil
        // TODO: Put in images
        if let image = UIImage(named: name) {
            self.image = image
        } else {
            image = nil
        }
        
        hasVisited = false
        
        
    }
}
