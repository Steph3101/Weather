//
//  Weather.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import ObjectMapper

struct Weather: Mappable {
    
    var city: String?
    var date: Date?
    var shortDescription: String?
    var temperature: Float?
    var sunriseDate: Date?
    var sunsetDate: Date?
    var clouds: Int?
    var rain: Int?
    var humidity: Int?
    var pressure: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        city                <- map["name"]
        date                <- (map["dt"], DateTransform())
        shortDescription    <- map["weather.description"]
        temperature         <- map["main.temp"]
        sunriseDate         <- (map["sys.sunrise"], DateTransform())
        sunsetDate          <- (map["sys.sunset"], DateTransform())
        clouds              <- map["clouds.all"]
        rain                <- map["rain.3h"]
        humidity            <- map["main.humidity"]
        pressure            <- map["main.pressure"]
    }
}
