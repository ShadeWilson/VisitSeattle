//
//  DarkSkyError.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingFailure
}

