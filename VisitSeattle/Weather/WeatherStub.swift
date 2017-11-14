//
//  WeatherStub.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/13/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

struct WeatherStub {
    
    struct Key {
        static let temperature = "temperature"
        static let temperatureHigh = "temperatureHigh"
        static let temperatureLow = "temperatureLow"
        static let humidity = "humidity"
        static let precipitationProbability = "precipProbability"
        static let icon = "icon"
        static let cloudCover = "cloudCover"
    }
    
    static let jsonStub: [String: Any] = [
        Key.temperature: 55.4,
        Key.temperatureHigh: 69.0,
        Key.temperatureLow: 49.5,
        Key.humidity: 0.1,
        Key.precipitationProbability: 0.99,
        Key.icon: "rain",
        Key.cloudCover: 0.90
    ]
    
    static var data: WeatherModel {
        return WeatherModel(json: self.jsonStub)!
    }
}







