//
//  DarkSkyAPIClient.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

// TODO: This is going to take some addition to the client
// we want daily values for days, which will have to be formatted
// and we want the summary from hourly as well as currently

class DarkSkyAPIClient {
    fileprivate let apiKey = "6d2946ae6a966d9e886a30c7323d44ce"
    
    lazy var baseURL: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (WeatherModel?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinates, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: Any], let currentWeather = WeatherModel(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
            
        }
        
        task.resume()
    }
}
