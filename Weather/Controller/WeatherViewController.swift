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
    
    var weatherViewModel: WeatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherViewModel.delegate           = self
        forecastsTableView.tableFooterView  = UIView(frame: .zero)
        forecastsTableView.delegate         = self
        forecastsTableView.dataSource       = self
        
        ForecastTableViewCell.registerCell(forTableView: forecastsTableView)
        
        configureView()
    }
    
    func configureView() {
        
        cityLabel.text          = weatherViewModel.cityDisplayText
        descriptionLabel.text   = weatherViewModel.descriptionDisplayText
        temperatureLabel.text   = weatherViewModel.temperatureDisplayText
        sunriseLabel.text       = weatherViewModel.sunriseTimeDisplayText
        sunsetLabel.text        = weatherViewModel.sunsetTimeDisplayText
        cloudsLabel.text        = weatherViewModel.cloudsDiplayText
        rainLabel.text          = weatherViewModel.rainDiplayText
        humidityLabel.text      = weatherViewModel.humidityDiplayText
        pressureLabel.text      = weatherViewModel.pressureDiplayText
    }
}

extension WeatherViewController: WeatherViewModelDelegate {
    
    func modelDidLoadWeather() {
        configureView()
    }
    
    func modelDidLoadForecast() {
        forecastsTableView.reloadData()
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return weatherViewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.cellIdentifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(withViewModel: weatherViewModel.forecastCellViewModel(forRowAtIndex: indexPath))
        
        return cell
    }
}
