//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 06/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import UIKit

class ForecastTableViewCell: ASTableViewCell {

    var forecastCellViewModel: ForecastCellViewModel = ForecastCellViewModel()
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    func configure(withViewModel forecastCellViewModel: ForecastCellViewModel) {
        
        self.forecastCellViewModel  = forecastCellViewModel
        dayLabel.text               = forecastCellViewModel.dayDisplayText
        minTemperatureLabel.text    = forecastCellViewModel.minTemperatureDisplayText
        maxTemperatureLabel.text    = forecastCellViewModel.maxTemperatureDisplayText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dayLabel.text               = forecastCellViewModel.placeHolderText
        minTemperatureLabel.text    = forecastCellViewModel.placeHolderText
        maxTemperatureLabel.text    = forecastCellViewModel.placeHolderText
    }
}
