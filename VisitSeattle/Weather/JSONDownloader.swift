//
//  JSONDownloader.swift
//  VisitSeattle
//
//  Created by Shade Wilson on 11/14/17.
//  Copyright © 2017 Shade Wilson. All rights reserved.
//

import Foundation

// manager is too vague to be a good name,
// we only initial one network session to download JSON data
class JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: Any]
    
    // TODO: look up completion handlers
    func jsonTask(with request: URLRequest, competionHandler completion: @escaping (JSON?, DarkSkyError?) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
            // Covert to HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        
        return task
    }
}





