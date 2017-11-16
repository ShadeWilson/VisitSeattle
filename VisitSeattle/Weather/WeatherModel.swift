//
//  WeatherModel.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/13/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

struct Key {
    // currently
    static let temperature = "temperature"
    static let humidity = "humidity"
    static let precipitationProbability = "precipProbability"
    static let cloudCover = "cloudCover"
    
    // hourly
    static let summary = "summary"
    
    // daily: actual data is array? with key of data
    static let data = "data"
    static let temperatureHigh = "temperatureHigh"
    static let temperatureLow = "temperatureLow"
    static let sunriseTime = "sunriseTime"
    static let sunsetTime = "sunsetTime"
    static let icon = "icon"
}

struct Day {
    let temperatureHigh: Double
    let temperatureLow: Double
    let icon: String
    let sunriseTime: Double
    let sunsetTime: Double
}

// TODO: may need to be revamped
struct WeatherModel {
    // grab from currently
    let currentTemperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let cloudCover: Double
    
    // grab from hourly
    let summary: String
    
    // grab from daily. Maybe this shouldn't be an array, could have multiple objects but this feels cleaner
    // can we easily format dailyJson in WeatherViewModel?
    // let days: [Day]
}

extension WeatherModel {
    
    // this will fail if any of the values are nil I think
    init?(currentJson: [String: Any], hourlyJson: [String: Any], dailyJson: [String: Any]) {
        guard let tempValue = currentJson[Key.temperature] as? Double,
            let humidityValue = currentJson[Key.humidity] as? Double,
            let precipitationProbabilityValue = currentJson[Key.precipitationProbability] as? Double,
            // let iconString = json[Key.icon] as? String,
            let cloudCoverValue = currentJson[Key.cloudCover] as? Double,
            let summaryString = hourlyJson[Key.summary] as? String else { return nil }
            //let days = dailyJson else { return nil }
        
        self.currentTemperature = tempValue
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.cloudCover = cloudCoverValue
        
        self.summary = summaryString
        
        // self.days = days
    }
}













