//
//  Forecast.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 04/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import ObjectMapper

struct Forecast: Mappable {

    var date: Date?
    var minTemperature: Float?
    var maxTemperature: Float?
 
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        date            <- (map["dt"], DateTransform())
        minTemperature  <- map["temp.min"]
        maxTemperature  <- map["temp.max"]
    }
}
