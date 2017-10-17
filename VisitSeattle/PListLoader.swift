//
//  PListLoader.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 10/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

enum PlistError: Error {
    case invalidResource
    case parsingFailure
}

class PlistLoader {
    static func array(fromFile name: String, ofType type: String) throws -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw PlistError.invalidResource
        }
        
        // creates an array of dictionaries (aka a PList)
        guard let array = NSArray(contentsOfFile: path) as? [[String: String]] else {
            throw PlistError.parsingFailure
        }
        
        return array
    }
}

class SightsSource {
    static var sights: [Sight] {
        let data = try! PlistLoader.array(fromFile: "SightsList", ofType: "plist")
        
        
        // flatMap operates on the array itself
        // $0 is first parameter (argument) passed into the closure
        // here flatMap takes the array itself as its arg ($0)
        // and passes the array (called array in PListLoader above)
        // flatMap automatically unwraps Contact and returns
        // array of unwrapped Contacts
        // (might be able to use map if also unwrap)
        return data.flatMap { Sight(dictionary: $0) }
    }
    
    // allows for sorting based on category
    static var sortedUniqueCategories: [String] {
        let categories = sights.map { $0.category }
        let uniqueCategories = Set(categories) // unordered, but unique list
        return Array(uniqueCategories).sorted()
    }
    
    static var sectionedCategories: [[Sight]] {
        return sortedUniqueCategories.map { category in
            let filteredCategories = sights.filter { $0.category == category }
            return filteredCategories.sorted(by: { $0.category < $1.category })
        }
    }
    
}

