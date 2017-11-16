//
//  Coordinates.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/13/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

struct Coordinates {
    let latitude:  Double
    let longitude: Double
    
    // default is seattle for now, so makes sense to hard code this in
    static let seattleLatitude = 47.6062
    static let seattleLongitude = -122.3321
}

extension Coordinates: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    var seattleDescription: String {
        return "\(Coordinates.seattleLatitude),\(Coordinates.seattleLongitude)"
    }
}










