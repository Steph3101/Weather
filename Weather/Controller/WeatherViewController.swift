//
//  WeatherViewController.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var forecastsTableView: UITableView!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.sharedInstance.getCurrentWeather(success: { (weather) in
            
            self.weatherViewModel = WeatherViewModel(weather: weather)
            self.configureView()
            
        }) { (error) in
            
            print(error)
        }
    }
    
    func configureView() {
        
        cityLabel.text          = weatherViewModel?.cityDisplayText
        descriptionLabel.text   = weatherViewModel?.descriptionDisplayText
        temperatureLabel.text   = weatherViewModel?.temperatureDisplayText
        sunriseLabel.text       = weatherViewModel?.sunriseTimeDisplayText
        sunsetLabel.text        = weatherViewModel?.sunsetTimeDisplayText
        cloudsLabel.text        = weatherViewModel?.cloudsDiplayText
        rainLabel.text          = weatherViewModel?.rainDiplayText
        humidityLabel.text      = weatherViewModel?.humidityDiplayText
        pressureLabel.text      = weatherViewModel?.pressureDiplayText
    }
}
