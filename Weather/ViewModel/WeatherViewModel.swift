//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

protocol WeatherViewModelDelegate {
    
    func modelDidLoadWeather()
    func modelDidLoadForecast()
}

class WeatherViewModel: NSObject {

    let placeHolderText: String = "-"
    var weather: Weather?
    var forecastsViewModels: [ForecastCellViewModel]?
    var dateFormatter: DateFormatter?
    var delegate: WeatherViewModelDelegate? = nil
    
    override init() {
        
        super.init()
        loadWeather()
        loadForecasts()
        
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "h:mm a"
    }
    
    func loadWeather() {
        
        APIManager.sharedInstance.getCurrentWeather(success: { (weather) in
            
            self.weather = weather
            self.delegate?.modelDidLoadWeather()
        }) { (error) in
            
            print(error)
        }
    }
    
    func loadForecasts() {
        
        APIManager.sharedInstance.getForecasts(success: { (forecasts) in
            
            self.forecastsViewModels = [ForecastCellViewModel]()
            
            for forecast in forecasts {
                
                self.forecastsViewModels?.append(ForecastCellViewModel(withForecast: forecast))
            }
            
            self.delegate?.modelDidLoadForecast()
        }, failure: { (error) in
            
            print(error)
        })
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
        return ("\(Int(temperature)) °")
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
    
    // MARK: TableView viewModel
    var numberOfSection: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return forecastsViewModels?.count ?? 0
    }
    
    func forecastCellViewModel(forRowAtIndex indexPath: IndexPath) -> ForecastCellViewModel {
    
        guard let models = forecastsViewModels else {
            return ForecastCellViewModel()
        }
        
        return models[indexPath.row]
    }
}
