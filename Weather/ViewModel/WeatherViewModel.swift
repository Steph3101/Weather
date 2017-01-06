//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

class WeatherViewModel: NSObject {

    let placeHolderText: String = "-"
    var weather: Weather?
    var dateFormatter: DateFormatter?
    
    convenience init(weather: Weather) {
        
        self.init()
        self.weather = weather
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "h:mm a"
    }
    
    
    // MARK: Tools
    func time(fromDate date: Date) -> String? {
        return dateFormatter?.string(from: date)
    }
    
    
    // MARK: Texts
    var cityDisplayText: String {
        guard let city = weather?.city else {
            return placeHolderText
        }
        return city
    }
    
    var descriptionDisplayText: String {
        guard let shortDescription = weather?.shortDescription else {
            return placeHolderText
        }
        return shortDescription
    }
    
    var temperatureDisplayText: String {
        guard let temperature = weather?.temperature else {
            return placeHolderText
        }
        return ("\(temperature) °")
    }
    
    var sunriseTimeDisplayText: String {
        guard let sunriseDate = weather?.sunriseDate else {
            return placeHolderText
        }
        
        return time(fromDate: sunriseDate) ?? placeHolderText
    }
    
    var sunsetTimeDisplayText: String {
        guard let sunsetDate = weather?.sunsetDate else {
            return placeHolderText
        }
        
        return time(fromDate: sunsetDate) ?? placeHolderText
    }
    
    var cloudsDiplayText: String {
        guard let clouds = weather?.clouds else {
            return placeHolderText
        }
        return ("\(clouds) %")
    }
    
    var rainDiplayText: String {
        guard let rain = weather?.rain else {
            return placeHolderText
        }
        return ("\(rain) mm")
    }
    
    var humidityDiplayText: String {
        guard let humidity = weather?.humidity else {
            return placeHolderText
        }
        return ("\(humidity) %")
    }
    
    var pressureDiplayText: String {
        guard let pressure = weather?.pressure else {
            return placeHolderText
        }
        return ("\(pressure) hPa")
    }
}
