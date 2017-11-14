//
//  WeatherModel.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/13/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

struct Key {
    static let temperature = "temperature"
    static let temperatureHigh = "temperatureHigh"
    static let temperatureLow = "temperatureLow"
    static let humidity = "humidity"
    static let precipitationProbability = "precipProbability"
    static let icon = "icon"
    static let cloudCover = "cloudCover"
}

struct WeatherModel {
    let temperature: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let humidity: Double
    let precipitationProbability: Double
    let icon: String
    let cloudCover: Double
}

extension WeatherModel {
    
    // this will fail if any of the values are nil I think
    init?(json: [String: Any]) {
        guard let tempValue = json[Key.temperature] as? Double,
            let tempHigh = json[Key.temperatureHigh] as? Double,
            let tempLow = json[Key.temperatureLow] as? Double,
            let humidityValue = json[Key.humidity] as? Double,
            let precipitationProbabilityValue = json[Key.precipitationProbability] as? Double,
            let iconString = json[Key.icon] as? String,
            let cloudCoverValue = json[Key.cloudCover] as? Double else { return nil }
        
        self.temperature = tempValue
        self.temperatureHigh = tempHigh
        self.temperatureLow = tempLow
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.icon = iconString
        self.cloudCover = cloudCoverValue
    }
}













