//
//  ForecastCellViewModel.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 06/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

struct ForecastCellViewModel {
    
    let placeHolderText: String = "-"
    var forecast: Forecast?
    var dateFormatter: DateFormatter?
    
    init(withForecast forecast: Forecast) {
        
        self.init()
        self.forecast = forecast
    }
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "EEEE"
    }
    
    // MARK: Tools
    func day(fromDate date: Date) -> String? {
        return dateFormatter?.string(from: date)
    }
    
    // MARK: Texts
    var dayDisplayText: String {
        guard let date = forecast?.date else {
            return placeHolderText
        }
        return day(fromDate: date) ?? placeHolderText
    }
    
    var minTemperatureDisplayText: String {
        guard let minTemperature = forecast?.minTemperature else {
            return placeHolderText
        }
        
        return "\(Int(minTemperature))°"
    }
    
    var maxTemperatureDisplayText: String {
        guard let maxTemperature = forecast?.maxTemperature else {
            return placeHolderText
        }
        
        return "\(Int(maxTemperature))°"
    }
}
