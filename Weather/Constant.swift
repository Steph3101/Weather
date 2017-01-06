//
//  Constant.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import Foundation

let apiKey = "9b2b49700676ec71128792126b9e5471"
let cityId = "2996944"

struct APIPath {
    
    static let baseUrl  = "http://api.openweathermap.org/data/2.5"
    static let weather  = baseUrl+"/weather"
    static let forecast = baseUrl+"/forecast"
    static let daily    = forecast+"/daily"
}

struct APIParameter {
    
    static let appId    = "APPID"
    static let id       = "id"
    static let units    = "units"
    static let count    = "count"
}
